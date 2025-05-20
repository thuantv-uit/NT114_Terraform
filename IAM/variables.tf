variable "region" {
  description = "AWS region để triển khai tài nguyên"
  type        = string
  default     = "us-east-1"
}

variable "user_name" {
  description = "Tên của IAM user"
  type        = string
  default     = "hello-iam-user"
}
