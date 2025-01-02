/*
  This file contains details about the variables used in this configuration.
  The values for these variables are contained within the secrets.tfvars file but
  there are additional details specified here. 
  Note the sensitive property. Under normal circumstances, Terraform will display all
  the values for the configuration when you run plan and deploy steps. The sensitive
  property on a variable tells it to hide its value.  
*/

/*
  For maximum security, set the local_source_ip to the IP provided by your ISP with 
  a netmask of /32. For example... "234.158.113.98/32"
  This will restrict access to the security group from only your location.
*/
variable "local_source_ip" {
  description = "Single IP allowed to access the ec2 instance"
  type        = string
  sensitive   = true #hides the details from the deploy output and log files
}
