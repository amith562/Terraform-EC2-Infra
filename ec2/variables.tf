variable "security_group_name" {
  description = "Name of the Jenkins server security group"
  type        = string
  default     = "jenkins-server-security-group"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "ssh_port" {
  description = "Port number for SSH access"
  type        = number
  default     = 22
}

variable "jenkins_port" {
  description = "Port number for Jenkins access"
  type        = number
  default     = 8080
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami" {

}

variable "instance_type" {

}
variable "volume_size" {

}
variable "volume_type" {

}
