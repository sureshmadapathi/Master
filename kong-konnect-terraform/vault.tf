# Vault already created in previous pipeline run
# Commenting out to avoid duplicate creation error

# resource "konnect_gateway_vault" "aws_secrets" {
#   control_plane_id = var.control_plane_id
#   name             = "aws"
#   prefix           = "aws-vault"
#   description      = "AWS Secrets Manager Vault"
#   config = jsonencode({
#     region = var.aws_region
#   })
# }