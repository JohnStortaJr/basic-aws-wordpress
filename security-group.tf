/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_security_group. This group is what will control
  access to the environment.
*/

#The name provided on the first line is for Terraform
#The name provided within the block is the name within AWS (they do not need to match)
resource "aws_security_group" "basicec2lab-ssh-sg" {
  name        = "basicec2lab-ssh-sg"
  description = "Enable ssh access on port 22"

  #what traffic is allowed in (should be only your public IP address)
  ingress {
    description      = "SSH Access from single IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.aws_access_source]    #this variable is populated in the secret.tfvars file with your IP address
  }

  #what traffic is allowed out (everything)
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