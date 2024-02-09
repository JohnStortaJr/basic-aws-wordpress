/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating an aws_key_pair. This is the public key for an SSH
  key pair that will be loaded on the EC2 instance to allow SSH access.
  Without a key pair, you will be unable to access the EC2 instance. 
*/

/*
  The name provided on the first line is for use within Terraform
  The key_name provided within the block is the name used within AWS (they do not need to match)
*/
resource "aws_key_pair" "basicec2lab-key01" {
  key_name   = "basicec2lab-key01"
  public_key = var.aws_key #This value is populated within your secret.tfvars file
}