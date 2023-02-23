
output "public_ip" {
  value = aws_instance.forpython.public_ip
  description = "The public IP of the web server"
}

output "port" {
  value       = var.server_port
  description = "The port of the web server"
}






