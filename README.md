# Basic EC2 Lab
Introduction to using Terraform to build a set of EC2 instances using default infrastructure

This environment takes advantage of the core elements that you get with every AWS account and adds a couple internet-accessible EC2 instances that can be used for basic testing. It is meant to be your first step into the world of AWS.

The default VPC, subnets, and internet gateway are automatically built when your AWS account is created. Each EC2 instance is built with public-facing IPv4 addresses so they can be accessed remotely from your personal IP.

This lab is only for basic testing purposes and should NOT be used for any sensitive content.

Resources used…
    VPC (prebuilt)
    Subnets (prebuilt)
        CIDR for AZ 2 may be different
    Internet Gateway (prebuilt)
    Route Tables (prebuilt)
    Security Group
    Key Pair
    EC2


****Prerequisites****
-> Terraform is installed
-> An AWS Access Key and Secret Key pair have been created
-> AWS CLI is installed
-> A named profile for the AWS CLI has been created
-> An S3 bucket for the Terraform state file has been created
None of the above steps are covered within this configuration

****secret.tfvars****
In order to use this configuration, you will need to create a secret.tfvars file containing the following...
aws_access_source="LOCAL_IP_CIDR"
aws_key="PUBLIC_KEY"

*LOCAL_IP_CIDR* is the CIDR notation for your internet IP. Note that the IP you need is the public IP provided by your ISP, not your local desktop IP
*PUBLIC_KEY* is your public SSH key. The default key is usually located in ~/.ssh/id_rsa.pub. Paste the contents of this file inside the double quotes

Refer to the comments within each .tf file for information about what they contain. It may help to review the files in this order...
main.tf             Terraform initialization
variable.tf         Variable definitions 
security-group.tf   Security group for access to the EC2 instances
access-key.tf       SSH key for logging in to the EC2 instances
instances.tf        EC2 configurations
