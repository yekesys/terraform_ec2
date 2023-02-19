
put this in variable.tf
variable "aws_region"
  description = "What goes in the file"
  type = string
}
variable "file_content" {
  description = "What goes in the file"
  type = string
}
variable "file_content" {
  description = "What goes in the file"
  type = string
}
variable "file_content" {
  description = "What goes in the file"
  type = string
}
variable "file_content" {
  description = "What goes in the file"
  type = string
}


provider "aws" {
  region = var.aws_region
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
}


resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  # reference to another part of the configuration:
  vpc_security_group_ids = [aws_security_group.instance.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "terraform-example"
  }

}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "port" {
  value       = var.server_port
  description = "The port of the web server"
}



