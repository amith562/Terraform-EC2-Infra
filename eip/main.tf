resource "aws_eip" "jenkins-server" {
  instance = var.instance
  tags = {
    instance = "jenkins-server"
  }
}
