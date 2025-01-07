/*
  Create one aws_instance (EC2) to host the WordPress site. 
  Be sure to look up the default user for whatever image you use.
  For our image, the default user is ubuntu.
*/

/*
  The name provided on the first line is for use within Terraform 
  The Tag Name provided within the block is the name used within AWS (they do not need to match)
  Note that neither of the names provided are the hostname of the instance. AWS will create hostnames dynamically.
*/
resource "aws_instance" "basicwplab-pub" {
  count                  = 1                       # How many instances should be created with this configuration
  ami                    = "${var.target_ami01}"   # Populated in variables.tf
  instance_type          = "t2.micro"              # The size of the instance (t2.micro is free tier eligible)
  availability_zone      = "us-east-1a"            # The Availability Zone where this instance should be built
  key_name               = "${aws_key_pair.basicwplab-key01.key_name}"

  subnet_id              = "${element(aws_subnet.basic-aws-wordpress-subnet-pub1.*.id, count.index)}"
  vpc_security_group_ids = [aws_security_group.basic-aws-wordpress-sg1.id] # The security group that will allow SSH access to this instance from your IP

  // This script will be executed on the EC2 instance when it is launched. It will not execute when the instance is restarted
  // You can check the /var/log/cloud-init-output.log file on the instance for details on the execution.
  user_data              = file("./scripts/WP_Setup.sh")


  /*
        This is the AWS name for each instance created
        We are creating multiple instances as indicated by the count property
        The count.index starts at 0 and will increment automatically for each instance (this is a built-in Terraform variable)
        This name is what we will see on the AWS console for the instance, but it is not the hostname of the instance
    */
  tags = {
    Name = "Basic WordPress Server PUB0${count.index}"
  }
}
