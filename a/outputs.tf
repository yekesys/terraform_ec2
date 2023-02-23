
output "public_ip" {
  value = module.ec2_inst.public_ip
  description = "The public IP of the web server"
}

output "port" {
  value       = module.ec2_inst.port
  description = "The port of the web server"
}



