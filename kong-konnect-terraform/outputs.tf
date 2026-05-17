output "control_plane_id" {
  value       = konnect_gateway_control_plane.main.id
  description = "Control Plane ID — use in terraform.tfvars"
}

output "control_plane_endpoint" {
  value       = konnect_gateway_control_plane.main.config.control_plane_endpoint
  description = "Control Plane endpoint for Data Plane Helm values"
}

output "telemetry_endpoint" {
  value       = konnect_gateway_control_plane.main.config.telemetry_endpoint
  description = "Telemetry endpoint for Data Plane Helm values"
}

output "cluster_cert" {
  value       = tls_self_signed_cert.cluster.cert_pem
  sensitive   = true
  description = "TLS cert for Data Plane"
}