resource "konnect_gateway_vault" "aws_secrets" {
  control_plane_id = konnect_gateway_control_plane.main.id    # ← reference resource directly
  name             = "aws"
  prefix           = "aws-vault"
  description      = "AWS Secrets Manager Vault"
  config = jsonencode({
    region = var.aws_region
  })
}