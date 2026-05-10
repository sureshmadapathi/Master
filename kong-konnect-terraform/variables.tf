variable "konnect_token" {
  sensitive = true
}

variable "control_plane_id" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"   # your AWS region
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

variable "redis_host" {
  type = string
}

variable "redis_port" {
  type    = number
  default = 6379
}