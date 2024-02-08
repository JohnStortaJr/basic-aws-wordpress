# Basic EC2 Lab
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<img src="Basic%20EC2%20Lab%20Network%20Diagram.png" alt="Basic EC2 Lab Network Diagram" width="400">
=======
![Basic EC2 Lab Network Diagram](Basic%20EC2%20Lab%20Network%20Diagram.png)
>>>>>>> fe2487e (Update links)
=======
![Basic EC2 Lab Network Diagram](Basic%20EC2%20Lab%20Network%20Diagram.png|width=200)
>>>>>>> 4d8da9f (Update image size)
=======
[Basic EC2 Lab Network Diagram](Basic%20EC2%20Lab%20Network%20Diagram.png|width=200)
<img src="Basic%20EC2%20Lab%20Network%20Diagram.png" width="200">
>>>>>>> d7d3ed3 (Update image size)

=======
![Basic EC2 Lab Network Diagram](https://github.com/JohnStortaJr/basicec2lab/blob/main/Basic%20EC2%20Lab%20Network%20Diagram.png)
<<<<<<< HEAD
>>>>>>> fb0f4b3 (Add network diagram)
=======

>>>>>>> 702b445 (Format lists)
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
- Create an IAM user for your AWS account with the `AdministratorAccess` policy
- Install Terraform on your local machine
- Create an AWS Access Key and Secret Key (*be sure to save these keys*)
- Install the AWS CLI
- Configure the AWS CLI with a named profile
- Create an S3 bucket for the Terraform state file (*optional*)

## secret.tfvars
There are a number of values needed during the deployment which 
should not be shared or visible. These are things like access keys, 
SSH keys, and IP addresses. 
You will need a `secret.tfvars` file that contains your secrets.
Refer to the [secret.md](secret.md) file for more information on this requirement.

## tf files
Terraform uses `.tf` files for the configuration. 
You can split your configuration up into as many, or as few, files as you desire. 
Terraform will view all files together as though they were one big file. 
Refer to the comments within each `.tf` file for specific information about what it contains.

It may be helpful to review the files in this order.
- `main.tf` Terraform initialization
- `variable.tf` Variable definitions 
- `security-group.tf` Security group to allow access to the EC2 instances
- `access-key.tf` SSH key for logging into the EC2 instances
- `instances.tf` EC2 configurations

## Deployment
Once all the prerequisites are completed and you have setup your `secret.tfvars` file, 
use the following commands to check and deploy the configuration.

Initialize Terraform
```
terraform init
```

This will reformat your code to match Terraform standards. This code is already 
written to those standards, but you can run the command anyway to see the output.
```
terraform fmt
```

Validate that the configuration is good. This command checks the syntax, but does
not check that the configuration is valid.
```
terraform validate
```

Compare the desired configuration with the current active configuration and
report back what changes will be made to bring the active configuration in line
with what is desired. This command reports what will be done, but takes no action.
```
terraform plan -var-file="secret.tfvars'
```

Execute the plan
```
terraform apply -var-file="secret.tfvars"
```

The configuration will take several minutes for all the resources to be created and
for the EC2 instances to complete their checks. You can monitor the status in the 
AWS Management Console.

## Access
Once the EC2 instances show that they are Running and have passed the checks, you
can access them from your local system using OpenSSH. 

The commands provided here are samples. Your DNS names will be different. You can get 
the `PUBLIC_DNS` for each instance from the AWS Management Console.

The default username for the AMI that we used is `ubuntu`.

If you used the default ssh key as your aws_key, then you should be able to use this command.
```
ssh ubuntu@PUBLIC_DNS
ssh ubuntu@ec2-00-11-22-333.compute-7.amazonaws.com
```

If you created a different ssh key, then you will need to specify it on the command line.
```
ssh -i PRIVATE_KEY_FILE ubuntu@PUBLIC_DNS
ssh -i "~/.ssh/awskey" ubuntu@ec2-00-11-22-333.compute-7.amazonaws.com
```
=======
Introduction to using Terraform to build a set of EC2 instances using default infrastructure
=======
This repository contains the files necessary to build out a (very) basic EC2 lab environment using Terraform.
>>>>>>> b70eac9 (Add comments to all files)

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

<<<<<<< HEAD
It may help to review the files in this order...
main.tf             Terraform initialization
variable.tf         Variable definitions 
<<<<<<< HEAD
=======
Introduction to using Terraform to build a set of EC2 instances using default infrastructure
=======
This repository contains the files necessary to build out a (very) basic EC2 lab environment using Terraform.
>>>>>>> b70eac9 (Add comments to all files)
=======
**View this file as code**
=======
>>>>>>> 73586ad (Update readme formatting)
This repository contains the files necessary to build out
a (very) basic EC2 lab environment using Terraform.
>>>>>>> 18fcfad (Update readme comment)

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

# Resources used…
    -> VPC (*AWS default*)
    -> Subnets (*AWS default*)
    -> Internet Gateway (*AWS default*)
    -> Route Tables (*AWS default*)
    -> Security Group
    -> Key Pair
    -> EC2

# Cost
All resources used in this environment are part of the AWS free tier. 
Be sure to check the current free tier limitations on these
resources before building this environment.

# Prerequisites
    -> Create an AWS account (free tier will work fine)
    -> Create an IAM user for your AWS account with the AdministratorAccess policy
    -> Install Terraform on your local machine
    -> Create an AWS Access Key and Secret Key (be sure to save these keys)
    -> Install the AWS CLI
    -> Configure the AWS CLI with a named profile
    -> Create an S3 bucket for the Terraform state file (optional)
This repository is focused on the deployment of infrastructure, 
not the setup of your environment. 
Ensure the following items are completed before 
attempting to implement this configuration.

# secret.tfvars
There are a number of values needed during the deployment which 
should not be shared or visible. These are things like access keys, 
SSH keys, and IP addresses. 
You will need a secret.tfvars file that contains your secrets.
Refer to the secret.sample file for more information on this requirement.

# tf files
    -> main.tf             Terraform initialization
    -> variable.tf         Variable definitions 
    -> security-group.tf   Security group to allow access to the EC2 instances
    -> access-key.tf       SSH key for logging into the EC2 instances
    -> instances.tf        EC2 configurations

Terraform uses .tf files for the configuration. 
You can split your configuration up into as many, or as few, files as you desire. 
Terraform will view all files together as though they were one big file. 
Refer to the comments within each .tf file for specific information about what it contains.

<<<<<<< HEAD
It may help to review the files in this order...
main.tf             Terraform initialization
variable.tf         Variable definitions 
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> e5fabc9 (Update README)
main.tf             Terraform and AWS initialization
security-group.tf   
access-key.tf
instances.tf
<<<<<<< HEAD
>>>>>>> e5fabc9 (Update README)
=======
security-group.tf   Security group to allow access to the EC2 instances
access-key.tf       SSH key for logging into the EC2 instances
instances.tf        EC2 configurations
>>>>>>> b70eac9 (Add comments to all files)
=======
>>>>>>> e5fabc9 (Update README)
=======
security-group.tf   Security group for access to the EC2 instances
access-key.tf       SSH key for logging in to the EC2 instances
=======
security-group.tf   Security group to allow access to the EC2 instances
access-key.tf       SSH key for logging into the EC2 instances
>>>>>>> b70eac9 (Add comments to all files)
instances.tf        EC2 configurations
>>>>>>> 7aa70a1 (Update tf file descriptions in README)
=======
It may be helpful to review the files in the above order.
>>>>>>> 8bc06fc (Update readme tf file formatting)
=======
It may be helpful to review the files in this order.
- `main.tf` Terraform initialization
- `variable.tf` Variable definitions 
- `security-group.tf` Security group to allow access to the EC2 instances
- `access-key.tf` SSH key for logging into the EC2 instances
- `instances.tf` EC2 configurations

>>>>>>> 78716c1 (Update readme file formatting)
