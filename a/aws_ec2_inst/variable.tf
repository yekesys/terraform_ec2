
variable "ec2_instance_name" {
  description = "The name of the EC2 instance"
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI for the instance to launch"
}

variable "key_name" {
  description = "The name of the key pair"
}


variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
}



