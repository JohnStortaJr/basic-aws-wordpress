/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_key_pair. This is the public key for an SSH
  key pair that will be added to the authorized_keys file on the EC2 instance 
  to allow for remote SSH access.
  The private key must be located on the source machine.
  Without a key pair, you will be unable to access the EC2 instance. 
*/

/*
  The name provided on the first line is for use within Terraform
  The key_name provided within the block is the name used within AWS (they do not need to match)
*/

resource "aws_key_pair" "basicwplab-key01" {
  key_name   = "basicwplab-key01"
  public_key = "${var.ssl_public_key}"
}