variable "region" {
  description = "Vùng AWS để triển khai hạ tầng"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Khối CIDR cho VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Khối CIDR cho Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Khối CIDR cho Private Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "allowed_ssh_ip" {
  description = "Địa chỉ IP được phép SSH vào Public EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ami_id" {
  description = "ID của AMI cho EC2 instances"
  type        = string
  default     = "ami-0e8a34246278c21e4"
}

variable "state_bucket_name" {
  description = "Tên của S3 bucket để lưu trữ Terraform state"
  type        = string
  default     = "my-terraform-state-bucket-123"
}

variable "dynamodb_table_name" {
  description = "Tên của bảng DynamoDB để khóa trạng thái"
  type        = string
  default     = "terraform-locks"
}
