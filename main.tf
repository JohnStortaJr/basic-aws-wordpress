<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> b70eac9 (Add comments to all files)
/*
  This block indicates that this configuration will use AWS.
  It also specifies the region the resources will be deployed to (us-east-1)
  and which IAM user should be used to create these resources (trainer01a)
*/
<<<<<<< HEAD
provider "aws" {
  region  = "us-east-1"  #modify this to the region your choice
  profile = "trainer01a" #modify to an IAM user belonging to the AdministratorAccess policy
}


/*
  This block defines where the state file for Terraform will be stored.
  The state file is a critical part of Terraform as it contains a complete
  record of the configuration. 
  Refer to the s3bucket.md file for details on creating an s3 bucket from the AWS CLI
*/
terraform {
  backend "s3" {
    bucket  = "js2024-basicec2lab-bucket"     #replace with the name of your s3 bucket (you will NOT be able to write to this bucket)
    key     = "terraform.tfstate.basicec2lab" #this is the name for the state file object in your s3 bucket (anything you choose)
    region  = "us-east-1"
    profile = "trainer01a"
  }

  #If you plan to use a local state file, comment out the s3 block above
  #Local is the default backend so it is not necessary to explicitly declare it
  #backend "local" {}
=======
=======
>>>>>>> b70eac9 (Add comments to all files)
provider "aws" {
  region = "us-east-1"      #modify this to the region your choice
  profile = "trainer01a"    #modify to an IAM user belonging to the AdministratorAccess policy
}


/*
  This block defines where the state file for Terraform will be stored.
  The state file is a critical part of Terraform as it contains a complete
  record of the configuration. 
  Refer to the s3bucket.md file for details on creating an s3 bucket from the AWS CLI
*/
terraform {
  backend "s3" {
    bucket = "js2024-basicec2lab-bucket"        #replace with the name of your s3 bucket (you will NOT be able to write to this bucket)
    key    = "terraform.tfstate.basicec2lab"    #this is the name for the state file object in your s3 bucket (anything you choose)
    region = "us-east-1"
    profile = "trainer01a"
  }
<<<<<<< HEAD
>>>>>>> 2b7c3a7 (Setup main.tf access info)
=======

  #If you plan to use a local state file, comment out the s3 block above
  #Local is the default backend so it is not necessary to explicitly declare it
  #backend "local" {}
>>>>>>> b70eac9 (Add comments to all files)
}
