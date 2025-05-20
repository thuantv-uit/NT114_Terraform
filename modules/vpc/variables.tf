variable "vpc_cidr" {
  description = "Khối CIDR cho VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Khối CIDR cho Public Subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Khối CIDR cho Private Subnet"
  type        = string
}

variable "region" {
  description = "Vùng AWS"
  type        = string
}
