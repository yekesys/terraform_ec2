
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  #  version = "~> 1.4"
  region = "us-east-1"
  #  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "git-terraform-ec2-user"
}


module "ones3bucket" {
  source               = "./s3bucket"
  s3_bucket_name       = "chris41-yeke-temp-git-terraform"
  s3_website_bucket    = "chris41-yeke-temp-website-tf"
}








