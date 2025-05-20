variable "public_subnet_id" {
  description = "ID của Public Subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID của Private Subnet"
  type        = string
}

variable "public_sg_id" {
  description = "ID của Public Security Group"
  type        = string
}

variable "private_sg_id" {
  description = "ID của Private Security Group"
  type        = string
}

variable "ami_id" {
  description = "ID của AMI cho EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Tên của cặp khóa SSH"
  type        = string
}
