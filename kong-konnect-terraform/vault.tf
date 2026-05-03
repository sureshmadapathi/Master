resource "konnect_gateway_vault" "aws_secrets" {
  control_plane_id = var.control_plane_id

  name   = "aws-secrets"
  prefix = "aws"

  config = jsonencode({
    region     = "us-east-1"
    access_key = "dummy-access-key"
    secret_key = "dummy-secret-key"
  })
}