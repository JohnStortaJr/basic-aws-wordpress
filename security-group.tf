/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_security_group. This group is what will control
  access to each instance within the environment. A group is like a firewall
<<<<<<< HEAD
  around each instance within that security group. 
=======
  around each instance within that security group.
>>>>>>> a798a46 (Update readme notes)
*/

/*
  The name provided on the first line is for use within Terraform
  The name provided within the block is the name used within AWS (they do not need to match)
*/
resource "aws_security_group" "basicec2lab-ssh-sg" {
  name        = "basicec2lab-ssh-sg"
  description = "Enable ssh access on port 22"

<<<<<<< HEAD
  # This rule allows incoming SSH connections from your IP address
=======
  #This rule allows incoming traffic to SSH connections from your IP address
>>>>>>> a798a46 (Update readme notes)
  ingress {
    description = "SSH Access from single IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.aws_access_source] #this variable is populated in the secret.tfvars file with your IP address
  }

<<<<<<< HEAD
  # This rule allows incoming SSH connections from other instances on all subnets within the default VPC
  ingress {
    description = "SSH Between Instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/20"] #This is the CIDR for the subnets automatically created within the default VPC
  }

  #This rule allows ALL outgoing traffic from the instance
=======
  #This rule allows SSH connections from other instances on the subnets within the default VPC
  ingress {
    description      = "SSH Between Instances"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/20"]    #This is the CIDR for the subnets automatically created within the default VPC
  }

  #This rule allows ALL traffic out from the instance
>>>>>>> a798a46 (Update readme notes)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH Security Group"
  }
}