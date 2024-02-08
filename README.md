# Basic EC2 Lab
<img src="Basic%20EC2%20Lab%20Network%20Diagram.png" alt="Basic EC2 Lab Network Diagram" width="400">

This repository contains the files necessary to build out
a (very) basic EC2 lab environment using Terraform.

This environment takes advantage of the default infrastructure
you get with every AWS account and adds four internet-accessible
EC2 instances that can be used for basic testing. It is meant to
be your first step into the world of using AWS with Terraform.

The default VPC, subnets, and internet gateway are automatically
built when your AWS account is created. Each EC2 instance is built
with public-facing IPv4 addresses so they can be accessed remotely
from your personal IP (and ONLY your personal IP).

This lab is only for basic testing purposes and
should NOT be used for any sensitive content.

## Resources used…
- VPC (*AWS default*)
- Subnets (*AWS default*)
- Internet Gateway (*AWS default*)
- Route Tables (*AWS default*)
- Security Group
- Key Pair
- EC2

## Cost
All resources used in this environment are part of the AWS free tier. 
Be sure to check the current free tier limitations on these
resources before building this environment.

## Prerequisites
This repository is focused on the deployment of infrastructure, 
not the setup of your environment. 
Ensure the following items are completed before 
attempting to implement this configuration.
- Create an AWS account (free tier will work fine)
- Create an IAM user for your AWS account with the AdministratorAccess policy
- Install Terraform on your local machine
- Create an AWS Access Key and Secret Key (be sure to save these keys)
- Install the AWS CLI
- Configure the AWS CLI with a named profile
- Create an S3 bucket for the Terraform state file (optional)

## secret.tfvars
There are a number of values needed during the deployment which 
should not be shared or visible. These are things like access keys, 
SSH keys, and IP addresses. 
You will need a `secret.tfvars` file that contains your secrets.
Refer to the [secret.sample](secret.sample) file for more information on this requirement.

## tf files
Terraform uses .tf files for the configuration. 
You can split your configuration up into as many, or as few, files as you desire. 
Terraform will view all files together as though they were one big file. 
Refer to the comments within each .tf file for specific information about what it contains.

It may be helpful to review the files in this order.
- `main.tf` Terraform initialization
- `variable.tf` Variable definitions 
- `security-group.tf` Security group to allow access to the EC2 instances
- `access-key.tf` SSH key for logging into the EC2 instances
- `instances.tf` EC2 configurations

