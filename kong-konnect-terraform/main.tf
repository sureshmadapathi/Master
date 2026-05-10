terraform {
  required_version = ">= 1.3.0"   # ← THIS was missing — Terraform version, not Kong version

  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "~> 3.14.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
  server_url            = "https://us.api.konghq.com"   # ✅ correct for US North America
}