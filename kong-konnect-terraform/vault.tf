resource "konnect_gateway_vault" "aws_secrets" {
  control_plane_id = var.control_plane_id
  name             = "aws-secrets"
  prefix           = "aws"

  config = jsonencode({
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
  })
}