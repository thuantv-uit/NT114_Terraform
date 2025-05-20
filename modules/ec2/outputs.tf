output "public_instance_ip" {
  description = "Địa chỉ IP công cộng của Public EC2"
  value       = aws_instance.public.public_ip
}

output "private_instance_id" {
  description = "ID của Private EC2"
  value       = aws_instance.private.id
}
