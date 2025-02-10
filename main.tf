module "ec2-instance" {
  source        = "./ec2"
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.large"
  volume_type   = "gp3"
  vpc_id        = "vpc-0e452794fb032dc67"
  subnet_id     = "subnet-0b35415b637e28617"
  volume_size   = "20"
  key_name      = "jenkins-server"
}

module "eip" {
  source     = "./eip"
  instance   = module.ec2-instance.id
  depends_on = [module.ec2-instance]
}

module "ebs" {
  source            = "./ebs"
  volume_type       = "gp3"
  volume_size       = "50"
  instance_id       = module.ec2-instance.id
  availability_zone = module.ec2-instance.availability_zone
  depends_on        = [module.ec2-instance]
}

module "backup" {
  source     = "./backup"
  depends_on = [module.ebs]
}

