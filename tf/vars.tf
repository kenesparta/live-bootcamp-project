variable "aws_sso_profile" {
  type        = string
  description = "(string) global project name"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "Lets get Rusty - Bootcamp"
}

variable "owner" {
  type    = string
  default = "ken.esparta"
}

variable "ec2_key_pair" {
  type        = string
  description = "ssh public key pair"
}
