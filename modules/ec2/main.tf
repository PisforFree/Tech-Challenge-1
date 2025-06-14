# modules/ec2/main.tf

resource "aws_instance" "default" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}
