variable "aws_access_key" {
  type    = "string"
}

variable "aws_secret_key" {
  type    = "string"
}

variable "aws_region" {
  type    = "string"
  default = "eu-central-1"
}

variable "ubuntu_ami" {
  type = "string"
  default = "ami-090f10efc254eaf55"
}

variable "myip" {
  type = "string"
}
