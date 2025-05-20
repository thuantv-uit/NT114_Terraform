output "state_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "Tên của S3 bucket lưu trữ Terraform state"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "Tên của bảng DynamoDB để khóa trạng thái"
}
