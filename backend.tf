# This backend configuration is for storing the Terraform state file in an S3 bucket
terraform {
  backend "s3" {
    bucket         = "thuantv-terraform-state-bucket-123"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "thuantv-terraform-locks"
  }
}
