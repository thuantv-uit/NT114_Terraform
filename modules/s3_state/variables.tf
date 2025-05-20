variable "state_bucket_name" {
  description = "Tên của S3 bucket để lưu trữ Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Tên của bảng DynamoDB để khóa trạng thái"
  type        = string
}
