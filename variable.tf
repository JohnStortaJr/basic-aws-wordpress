/*
  This file contains details about the variables used as part of this configuration.
  The values for these variables are contained within the secret.tfvars file but
  there are additional details specified here. 
  Note the sensitive property. Under normal circumstances, Terraform will display all
  the values for the configuration when you run plan and deploy steps. The sensitive
  property on a variable tells it to hide its value.  
*/

variable "aws_access_source" {
  default     = "127.0.0.1/8"
  description = "Single IP allowed to access the ec2 instance"
  type        = string
  sensitive   = true #hides the details from the deploy output and log files
}

variable "PRIVATE_KEY" {
  default = "mykey"
  sensitive = true
}

variable "PUBLIC_KEY" {
  default = "mykey.pub"
  sensitive = true
}