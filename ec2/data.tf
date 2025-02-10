data "aws_key_pair" "jenkins-server" {
  key_name           = var.key_name
  include_public_key = true
}

data "aws_vpc" "jenkins-server" {
  id = var.vpc_id
}

data "aws_subnet" "jenkins-server" {
  id = var.subnet_id
}

variable "key_name" {
  
}

variable "subnet_id" {
  
}

