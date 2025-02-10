resource "aws_security_group" "jenkins-server" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.allowed_cidr_blocks
  }

  ingress {
    cidr_blocks = var.allowed_cidr_blocks
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
  }

  ingress {
    description = "Jenkins port"
    from_port   = var.jenkins_port
    to_port     = var.jenkins_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
}

# Create EC2 Instance
resource "aws_instance" "jenkins-server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.jenkins-server.id
  key_name      = data.aws_key_pair.jenkins-server.key_name

  vpc_security_group_ids = [aws_security_group.jenkins-server.id]

  root_block_device {
    volume_size           = var.volume_size    # 20GB root volume
    volume_type           = var.volume_type # General Purpose SSD
    delete_on_termination = true
  }

  # # Attach an additional 50GB external EBS volume
  # ebs_block_device {
  #   device_name           = "/dev/sdf" # Specify the device name for the external volume
  #   volume_size           = 50         # 50GB external volume
  #   volume_type           = "gp3"      # General Purpose SSD
  #   delete_on_termination = true
  # }

  tags = {
    Name = "jenkins-server"
  }
  depends_on = [aws_security_group.jenkins-server]
}

