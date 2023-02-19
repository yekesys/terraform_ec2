
provider "local" {
#  version = "~> 1.4"
}

module "create_a_file" {
  source = "./local_file"
  file_content = "\nA text\n"
  file_name = "filea.txt"
}


#provider "aws" {
##  version = "~> 1.4"
#}


#module "aws-inst" {
#  source = "./aws_ec2_inst"
#  region = var.aws_region
#}


