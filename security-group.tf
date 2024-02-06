# create security group for the EC2 instances
# terraform aws create security group

resource "aws_security_group" "basicec2lab-ssh-sg" {
  name        = "basicec2lab-ssh-sg"
  description = "Enable ssh access on port 22"

  ingress {
    description      = "SSH Access from single IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.aws_access_source]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "SSH Security Group"
  }
}