resource "konnect_gateway_vault" "aws_secrets" {
  control_plane_id = var.control_plane_id
  name             = "aws-sm"        # ← must be exact vault type: aws-sm, gcp-sm, hcv, env
  prefix           = "aws"
  description      = "AWS Secrets Manager Vault"

  config = jsonencode({
    region     = var.aws_region
    access_key_id     = var.aws_access_key
    secret_access_key = var.aws_secret_key
  })
}