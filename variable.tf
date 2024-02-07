<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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

variable "aws_key" {
  description = "SSL key for accessing the ec2 instance"
  type        = string
  sensitive   = true #hides the details from the deploy output and log files
=======
variable "ssh_local" {
    default = "172.72.249.14/32"
    description = "IP allowed to access ec2 instances"
    type = string
>>>>>>> 69fa5dd (Add security group and variable)
=======
=======
/*
  This file contains details about the variables used as part of this configuration.
  The values for these variables are contained within the secret.tfvars file but
  there are additional details specified here.
  Note the sensitive property. Under normal circumstances, Terraform will display all
  the values for the configuration when you run plan and deploy steps. The sensitive
  property on a variable tells it to hide its value.
*/

>>>>>>> b70eac9 (Add comments to all files)
variable "aws_access_source" {
    default = "127.0.0.1/8"
    description = "Single IP allowed to access the ec2 instance"
    type = string
    sensitive = true        #hides the details from the deploy output and log files
}

variable "aws_key" {
    description = "SSL key for accessing the ec2 instance"
    type = string
<<<<<<< HEAD
    sensitive = true
>>>>>>> 03b1cb5 (Initial basicec2lab config)
=======
    sensitive = true        #hides the details from the deploy output and log files
>>>>>>> b70eac9 (Add comments to all files)
}