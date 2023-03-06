
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "local" {
  #  version = "~> 1.4"
}

module "create_a_file" {
  source       = "./local_file"
  file_content = "\nA text\n"
  file_name    = "filea.txt"
}


provider "aws" {
  #  version = "~> 1.4"
  region = "us-east-1"
  #  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "git-terraform-ec2-user"
}


module "ec2_inst" {
  source            = "./ec2_inst"
  ec2_instance_name = "forpython-instance"
  ec2_instance_type = "t2.micro"
  ami_id            = "ami-0b5eea76982371e91"
  key_name          = "wk"
  server_port       = "22"
}


module "lambda_fn1" {
  source               = "./lambda_fn"
  lambda_function_name = "lambda_function_generated_by_tf"
  #s3_bucket_name       = data.s3_existing_bucket.name.s3_bucket_name
  s3_bucket_name       = var.s3_existing_bucket_name
}








