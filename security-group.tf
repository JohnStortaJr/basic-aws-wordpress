/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_security_group. This group is what will control
  access to each instance within the environment. A group is like a firewall
  around each instance within that security group.
*/

/*
  The name provided on the first line is for use within Terraform
  The name provided within the block is the name used within AWS (they do not need to match)
*/
resource "aws_security_group" "basic-aws-wordpress-sg1" {
  name        = "basicawswp-ssh-sg"
  description = "Enable ssh access on port 22"
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"


  # This rule allows incoming SSH connections from your IP address
  ingress {
    description = "SSH Access from single external IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.aws_access_source] #this variable is populated in the secret.tfvars file with your IP address
  }

  # This rule allows incoming HTTP connections from your IP address
  ingress {
    description = "HTTP Access from single external IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.aws_access_source] #this variable is populated in the secret.tfvars file with your IP address
  }

  # This rule allows incoming HTTPS connections from your IP address
  ingress {
    description = "HTTPS Access from single external IP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.aws_access_source] #this variable is populated in the secret.tfvars file with your IP address
  }

  # This rule allows incoming SSH connections from other instances on all subnets within the default VPC
  ingress {
    description = "SSH Between Instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"] #This is the CIDR for the subnets automatically created within the default VPC
  }

  #This rule allows ALL outgoing traffic from the instance 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Basic WordPress Security Group"
  }
}