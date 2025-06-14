resource "aws_instance" "web1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "Week_5_pair"
  tags = {
    Name = "WebServer1"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "Week_5_pair"
  tags = {
    Name = "WebServer2"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "Week_5_pair"
  tags = {
    Name = "WebServer3"
  }
}



