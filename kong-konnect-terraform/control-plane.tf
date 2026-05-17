# Control Plane
resource "konnect_gateway_control_plane" "main" {
  name         = "demo-control-plane"
  description  = "Main control plane"
  cluster_type = "CLUSTER_TYPE_HYBRID"
  auth_type    = "pki_client_auth"

  proxy_urls = [
    {
      host     = "localhost"
      port     = 80
      protocol = "http"
    }
  ]
}

# Generate TLS certificate for Data Plane mTLS
resource "tls_private_key" "cluster" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "cluster" {
  private_key_pem = tls_private_key.cluster.private_key_pem

  subject {
    common_name  = "kong_clustering"
    organization = "Kong"
  }

  validity_period_hours = 87600  # 10 years

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
}

# Store cert as Kubernetes secret for Data Plane
resource "kubernetes_secret" "kong_cluster_cert" {
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong"
  }

  data = {
    "tls.crt" = tls_self_signed_cert.cluster.cert_pem
    "tls.key" = tls_private_key.cluster.private_key_pem
  }

  type = "kubernetes.io/tls"
}

# Upload cert to Konnect Control Plane
resource "konnect_gateway_data_plane_client_certificate" "cluster" {
  cert             = tls_self_signed_cert.cluster.cert_pem
  control_plane_id = konnect_gateway_control_plane.main.id
}