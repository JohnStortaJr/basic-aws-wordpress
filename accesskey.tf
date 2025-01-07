/*
  This block creates an aws_key_pair. This is the public key for an SSH
  key pair that will be added to the authorized_keys file on the EC2 instance 
  to allow for remote SSH access.

  The corresponding private key must be located on the machine you are connecting from.
  Without a key pair, you will be unable to access the EC2 instance. 
*/

/*
  The name provided on the first line is for use within Terraform
  The key_name provided within the block is the name used within AWS (they do not need to match)
  The ssl_public_key_path variable should be set within the secrets.tfvars file. See secrets.md for details.
*/
resource "aws_key_pair" "basicwplab-key01" {
  key_name   = "basicwplab-key01"
  public_key = file("${var.ssl_public_key_path}")
}
