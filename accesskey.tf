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

resource "aws_key_pair" "basicwplab-key01" {
  key_name   = "basicwplab-key01"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCVbq6uJuABtxMnmMey/C1jSerK0AnJ4cnVV28yrB46N4pGqnyyrPfp66SYqBL8gpsv7v7Gaq/AweI8lbFGpaqQQITd+ln0L0qwx6tN6BiILSMYSrEP46Z3GKakG//4lCRYM+vfnDY74FiBKz/5sMUK0tlPjIaPhTnoUMzRNjLiZMixwKWFPmbNh7b8inVS3PKceskfXmlj0302lomcAky4mtm7K97M6wu5FF7bgJQQFoAeqAjvyg3tVQLiylvFoTDEdZBPqcxhw56/klOJkIGPuwrjfl90ECqa0GldJdyOulsEwNiFsmPj5lzJsyQebZLYeKmkReTtaQykyW2Vh+Cp8D1lw98gwpexbE4DKRTobr5Tx8FBup0Y1w43FnKnXQIckpGtNGvaKy+fSW4HTpeY6hhrwx/aA+ZqHkAKk6Yz+6ewL5leJ4ZyulxpAOoMWoUl7nQlG2Pt7IDlBbHeyydLoJDE2YkTny1gZaWQa5gsmXTnEAgk6/kHwkFOc+m4urU= reach@johnstortajr.com"
}