# create security group for the EC2 instances
# terraform aws create security group

resource "aws_security_group" "weblab-ssh-sg" {
  name        = "weblab-ssh-sg"
  description = "enable ssh access on port 22"

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.ssh_local]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = [0.0.0.0/0]
  }

  tags   = {
    Name = "SSH Security Group"
  }
}