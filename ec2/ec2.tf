resource "aws_instance" "app_server" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t2.micro"
  vpc_security_group_ids =[aws_security_group.allow_tls.id]

  tags = {
    Name = "vamsi-terraform"
    Project = "roboshop"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform"
  description = "Allow All traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all"
  }
}
