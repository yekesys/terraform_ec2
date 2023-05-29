

resource "aws_security_group" "sg-forpython" {
  name = "forpython-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}



resource "aws_instance" "forpython" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-forpython.id]

  tags = {
    Name = var.ec2_instance_name
  }

}






