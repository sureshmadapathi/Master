variable "konnect_token" {
  sensitive = true
}

variable "control_plane_id" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  sensitive = true
}

variable "aws_secret_key" {
  sensitive = true
}

variable "env" {
  type    = string
  default = "dev"
}