
output "instance_id" {
  value = aws_instance.forpython.public_ip
  description = "ID of the EC2 instance"
}

output "instance_public_ip" {
  value = aws_instance.forpython.public_ip
  description = "The public IP of the web server"
}

output "instance_server_port" {
  value       = var.server_port
  description = "The port of the web server"
}






