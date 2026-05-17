output "control_plane_id" {
  value = konnect_gateway_control_plane.main.id
}

output "control_plane_endpoint" {
  value = konnect_gateway_control_plane.main.config.control_plane_endpoint
}

output "telemetry_endpoint" {
  value = konnect_gateway_control_plane.main.config.telemetry_endpoint
}

output "cluster_cert" {
  value     = tls_self_signed_cert.cluster.cert_pem
  sensitive = true
}

output "cluster_key" {
  value     = tls_private_key.cluster.private_key_pem
  sensitive = true
}