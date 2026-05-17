terraform {
  required_version = ">= 1.3.0"

  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "~> 3.15.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
  server_url            = "https://us.api.konghq.com"
}