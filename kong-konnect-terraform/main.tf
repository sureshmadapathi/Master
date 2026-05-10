terraform {
  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "~> 1.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
}