output "access_key_id" {
  value       = aws_iam_access_key.my_user_key.id
  sensitive   = true
  description = "Access Key ID của IAM user"
}

output "secret_access_key" {
  value       = aws_iam_access_key.my_user_key.secret
  sensitive   = true
  description = "Secret Access Key của IAM user"
}
