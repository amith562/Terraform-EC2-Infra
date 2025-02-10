
resource "aws_ebs_volume" "jenkins-server" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  tags = {
    Name = "jenkins-server"
  }
 # depends_on = [ aws_instance.jenkins-server ]
}

resource "aws_volume_attachment" "jenkins-server" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.jenkins-server.id
  instance_id = var.instance_id
  depends_on = [ aws_ebs_volume.jenkins-server ]
}

