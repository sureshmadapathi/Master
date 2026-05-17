resource "tls_private_key" "cluster" {
  algorithm = "RSA"
  rsa_bits  = 2048
  lifecycle {
    ignore_changes = all
  }
}

resource "tls_self_signed_cert" "cluster" {
  private_key_pem = tls_private_key.cluster.private_key_pem
  subject {
    common_name  = "kong_clustering"
    organization = "Kong"
  }
  validity_period_hours = 87600
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
  lifecycle {
    ignore_changes = all
  }
}