output "vpc_id" {
  description = "ID của VPC"
  value       = module.vpc.vpc_id
}

output "public_instance_ip" {
  description = "Địa chỉ IP công cộng của Public EC2"
  value       = module.ec2.public_instance_ip
}

output "private_instance_id" {
  description = "ID của Private EC2"
  value       = module.ec2.private_instance_id
}
