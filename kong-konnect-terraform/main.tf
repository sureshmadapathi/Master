terraform {
  backend "s3" {
    bucket  = "kong-konnect-terraform-state-suresh"
    key     = "kong-konnect/terraform.tfstate"
    region  = "ap-south-1"
  }

  required_version = ">= 1.3.0"

  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "3.15.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
  server_url            = "https://us.api.konghq.com"
}