
output "public_ip" {
  value       = module.ec2_inst.public_ip
  description = "The public IP of the web server"
}

output "port" {
  value       = module.ec2_inst.port
  description = "The port of the web server"
}


output "ec2_module_outputs" {
  value       = module.ec2_inst
  description = "Outputs of the ec2_inst module"
}



