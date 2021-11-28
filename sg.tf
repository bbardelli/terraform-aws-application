resource "aws_security_group" "application_access" {
  name        = "application access"
  description = "Allow application access traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "application port from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    description      = "SG-Group Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups = security_group.application_access.id
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
