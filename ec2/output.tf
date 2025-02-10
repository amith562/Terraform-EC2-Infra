output "id" {
  value = aws_instance.jenkins-server.id
}
output "availability_zone" {
  value = data.aws_subnet.jenkins-server.availability_zone
}