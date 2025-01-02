/*
  This block creates an aws_key_pair. This is the public key for an SSH
  key pair that will be added to the authorized_keys file on the EC2 instance 
  to allow for remote SSH access.
  The private key must be located on the source machine.
  Without a key pair, you will be unable to access the EC2 instance. 
*/

/*
  The name provided on the first line is for use within Terraform
  The key_name provided within the block is the name used within AWS (they do not need to match)
  Update the file path to match the public key file you will use
*/
resource "aws_key_pair" "basicwplab-key01" {
  key_name   = "basicwplab-key01"
  public_key = file("~/.ssh/smjs20241219a_512rsa.pub")
}
