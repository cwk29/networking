resource "aws_ebs_volume" "mongo" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  tags  = {
    Name = "mongo-ebs-volume"
  }
}