/*
  This file contains details about the variables used as part of this configuration.
  The values for these variables are contained within the secrets.tfvars file but
  there are additional details specified here. 
  Note the sensitive property. Under normal circumstances, Terraform will display all
  the values for the configuration when you run plan and deploy steps. The sensitive
  property on a variable tells it to hide its value.  
*/

/*
  For maximum security, set the default access IP to your IP provided by your ISP with 
  a netmask of /32. This will restrict access to your instances to just your location.
*/
variable "aws_access_source" {
  default     = "300.300.300.3/32"
  description = "Single IP allowed to access the ec2 instance"
  type        = string
  sensitive   = true #hides the details from the deploy output and log files
}

/*
  Replace the paths listed with paths to the actual public and private keys you will use 
  when accessing the EC2 instances from your local machine
*/
variable "PRIVATE_KEY" {
  default   = "/home/username/.ssh/rsa"
  sensitive = true
}

variable "PUBLIC_KEY" {
  default   = "/home/username/.ssh/rsa.pub"
  sensitive = true
}