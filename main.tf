provider "aws" {
  region = "us-east-1"
  profile = "trainer01a"
}

terraform {
  backend "s3" {
    bucket = "jsbucket24-webserverlab"
    key    = "terraform.tfstate.dev"
    region = "us-east-1"
    profile = "trainer01a"
  }
}
