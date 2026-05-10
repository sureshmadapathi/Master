terraform {
  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "~> 3.14.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
  server_url            = "https://us.api.konghq.com"
}