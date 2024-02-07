<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> b70eac9 (Add comments to all files)
/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_security_group. This group is what will control
<<<<<<< HEAD
  access to each instance within the environment. A group is like a firewall
  around each instance within that security group.
*/

/*
  The name provided on the first line is for use within Terraform
  The name provided within the block is the name used within AWS (they do not need to match)
*/
resource "aws_security_group" "basicec2lab-ssh-sg" {
  name        = "basicec2lab-ssh-sg"
  description = "Enable ssh access on port 22"

  # This rule allows incoming SSH connections from your IP address
  ingress {
    description = "SSH Access from single IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.aws_access_source] #this variable is populated in the secret.tfvars file with your IP address
  }

  # This rule allows incoming SSH connections from other instances on all subnets within the default VPC
  ingress {
    description = "SSH Between Instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/20"] #This is the CIDR for the subnets automatically created within the default VPC
  }

  #This rule allows ALL outgoing traffic from the instance
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
=======
# create security group for the EC2 instances
# terraform aws create security group
=======
  access to the environment.
*/
>>>>>>> b70eac9 (Add comments to all files)

#The name provided on the first line is for Terraform
#The name provided within the block is the name within AWS (they do not need to match)
resource "aws_security_group" "basicec2lab-ssh-sg" {
  name        = "basicec2lab-ssh-sg"
  description = "Enable ssh access on port 22"

  #This rule limits external traffic to SSH connections from your IP address
  ingress {
    description      = "SSH Access from single IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.aws_access_source]    #this variable is populated in the secret.tfvars file with your IP address
  }

  #This rule allows SSH connections between all the difference instances
  ingress {
    description      = "SSH Between Instances"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/20"]
  }

  #what traffic is allowed out (everything)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
>>>>>>> 69fa5dd (Add security group and variable)
    Name = "SSH Security Group"
  }
}