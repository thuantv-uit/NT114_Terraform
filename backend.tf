# # backend.tf
# terraform {
#   backend "s3" {
#     bucket         = "thuantv-terraform-state-bucket-123" # Tên bucket từ terraform.tfvars
#     key            = "terraform.tfstate"                  # Đường dẫn tệp state trong bucket
#     region         = "us-east-1"                          # Vùng của bucket
#     dynamodb_table = "thuantv-terraform-locks"            # Tên bảng DynamoDB từ terraform.tfvars
#   }
# }
