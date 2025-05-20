# Bài tập thực hành NT548 - Công nghệ DevOps

## Tổng quan
Kho lưu trữ này chứa mã Terraform để triển khai hạ tầng AWS bao gồm VPC, EC2 instances, và Security Groups theo yêu cầu bài tập NT548.

## Yêu cầu
- Terraform >= 1.5
- AWS CLI đã cấu hình

## Cài đặt
1. Cài đặt Terraform và AWS CLI.
2. Cấu hình thông tin xác thực AWS bằng `aws configure`.
3. Cập nhật `terraform.tfvars` với địa chỉ IP công cộng và AMI ID hợp lệ.
4. Chạy các lệnh:
   ```bash
   terraform init
   terraform apply
   ```
5. File nt548-key.pem sẽ được tạo trong thư mục dự án.

## Kiểm tra
### SSH vào Public EC2:
    ```bash
    ssh -i nt548-key.pem ec2-user@<public-ec2-ip>
    ```
### SSH từ Public EC2 vào Private EC2:
    ```bash
    scp -i nt548-key.pem nt548-key.pem ec2-user@<public-ec2-ip>:~/.ssh/
    ssh -i ~/.ssh/nt548-key.pem ec2-user@<private-ec2-ip>
    ```
## Dọn dẹp
### Để tránh chi phí, xóa tài nguyên sau khi hoàn thành:
    ```bash
    terraform destroy
    rm nt548-key.pem
    ```