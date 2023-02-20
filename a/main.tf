
provider "local" {
#  version = "~> 1.4"
}

module "create_a_file" {
  source = "./local_file"
  file_content = "\nA text\n"
  file_name = "filea.txt"
}


provider "aws" {
#  version = "~> 1.4"
  region = "us-east-1"
}

module "aws-inst" {
  source = "./aws_ec2_inst"
  ec2_instance_name = "forpython-instance"
  ec2_instance_type = "t2.micro"
  ami_id            = "ami-0b5eea76982371e91"
  key_name          = "wk" 
  server_port       = "22" 
}





