# Basic EC2 Lab
<img src="Basic%20EC2%20Lab%20Network%20Diagram.png" alt="Basic EC2 Lab Network Diagram" width="400">

This repository contains the files necessary to build out
a (very) basic WordPress lab environment using Terraform.

This lab is only for basic testing purposes and
should NOT be used for any sensitive content.

## Resources included...
- VPC
- Subnets
- Internet Gateway
- Route Tables
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
- [Create an AWS account](https://johnstortajr.com/2023/10/08/create-aws-free-tier/)
- [Create an IAM user for your AWS account with the `AdministratorAccess` policy](https://johnstortajr.com/2023/10/08/create-aws-iam-user/)
- [Install Terraform on your local machine](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Create an AWS Access Key and Secret Key](https://johnstortajr.com/2024/02/10/create-aws-access-key/) (*be sure to save these keys*)
- [Configure the AWS CLI](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/index.html)
- [Create an S3 bucket for the Terraform state file](s3bucket.md) (*optional*)

## secrets.tfvars
This file contains values that you would not want uploaded to the GitHub repository.
This may include things like access keys, SSH keys, and local IP addresses. 
You will need a `secrets.tfvars` file that contains these sensitive values.
Refer to the [secrets.md](secrets.md) file for more information on this requirement.

## tf files
Terraform uses `.tf` files for the configuration. 
You can split your configuration up into as many, or as few, files as you desire. 
Terraform will view all files together as though they were one big file. 
Refer to the comments within each `.tf` file for specific information about what it contains.

It may be helpful to review the files in this order.
- `main.tf` Terraform initialization
- `variable.tf` Variable definitions 
- `network.tf` VPC, Subnets, Internet Gateway, Route Table, Routes
- `security-group.tf` Security group to allow access to the EC2 instances
- `accesskey.tf` SSH key for logging into the EC2 instances
- `instances.tf` EC2 configurations

## Deployment
Once all the prerequisites are completed and you have setup your `secrets.tfvars` file, use the following commands to check and deploy the configuration.

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
terraform plan -var-file="secrets.tfvars"
```

Execute the plan
```
terraform apply -var-file="secrets.tfvars"
```

The configuration will take several minutes for all the resources to be created and
for the EC2 instances to complete their checks. You can monitor the status in the 
AWS Management Console. 

## Access
Once the EC2 instances show that they are Running and have passed the checks, you
can access them from your local system using OpenSSH. 

The commands provided here are samples. Your DNS names will be different. You can get the `PUBLIC_DNS` for each instance from the AWS Management Console.

The default username for the AMI that we used is `ubuntu`.
If you used an Amazon Linux AMI, the default user is likely ec2-user.

You should be able to connect to the EC2 instances using this command.
Note that the key you provide must be the private key from the key pair
you used when creating the instance.
```
ssh -i PRIVATE_KEY_FILE ubuntu@PUBLIC_DNS
ssh -i "~/.ssh/awskey" ubuntu@ec2-00-11-22-333.compute-7.amazonaws.com
```

## Moving Within Subnet
Once the environment is created, you may want to ssh from one instance to another. During the build
process the public key was added to each instance. To make use of this key to access other instances
we must copy the private key from your desktop to each instance that you wish to ssh from.

```
scp -i mykey mykey ubuntu@ec2-00-11-22-333.compute-7.amazonaws.com:mykey
```

Once the private key is on an instance, you can then ssh to any of the other instances.
```
ssh ubuntu@ip-111-22-3-444.ec2.internal
```