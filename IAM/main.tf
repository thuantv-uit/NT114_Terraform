# Định nghĩa provider
provider "aws" {
  region = var.region
}

# Tạo IAM user
resource "aws_iam_user" "my_user" {
  name = var.user_name
  path = "/"

  tags = {
    Name = "thuan_iam"
  }
}

# Gắn chính sách AdministratorAccess cho user
resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.my_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Tạo access key cho user
resource "aws_iam_access_key" "my_user_key" {
  user = aws_iam_user.my_user.name
}
