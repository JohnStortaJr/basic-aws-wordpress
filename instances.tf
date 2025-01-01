/*
  Resource blocks are used to create resources in AWS. 
  The first parameter is the type of resource to be created. In this case
  we are creating several aws_instances (EC2). Be sure to look up the default user
  for whatever image you use. For our image, the default user is ubuntu.
*/

/*
  The name provided on the first line is for use within Terraform 
  The Tag Name provided within the block is the name used within AWS (they do not need to match)
  Note that neither of the names provided are NOT the hostnames of the instances. AWS will create hostnames.
*/
resource "aws_instance" "basicwplabaz1" {
  # The key pair and security group must be created before the instances are built
  #depends_on = [
  #  aws_key_pair.basicec2lab-key01,
  #  aws_security_group.basicec2lab-ssh-sg
  #]

  count                  = 2                       # How many instances should be created with this configuration
  ami                    = "ami-005fc0f236362e99f" # The AMI for this image (We are using Ubuntu22.04 LTS x86_64) 
  instance_type          = "t2.micro"              # The size of the instance (t2.micro is free tier eligible)
  availability_zone      = "us-east-1a"            # The Availability Zone where this instance should be built
  key_name               = "${aws_key_pair.basicwplab-key01.key_name}"
  subnet_id              = "${aws_subnet.basic-aws-wordpress-subnet-pub1.id}"
  vpc_security_group_ids = [aws_security_group.basic-aws-wordpress-sg1.id] # The security group that will allow SSH access to this instance from your IP

  /*
        This is the AWS name for each instance created
        We are creating multiple instances as indicated by the count property
        The count.index starts at 0 and will increment automatically for each instance (this is a built-in Terraform variable)
        This name is what we will see on the AWS console for the instance, but it is not the hostname of the instance
    */
  tags = {
    Name = "Basic WordPress Server az120${count.index}"
  }
}