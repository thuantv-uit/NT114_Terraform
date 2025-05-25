resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              # Tạo thư mục thuatv trong /
              mkdir -p /thuantv

              # Đăng nhập với quyền root
              sudo -i

              # Chuyển đến thư mục /thuatv
              cd /thuantv

              # Cập nhật danh sách gói
              apt update

              # Cài đặt Docker
              apt install -y docker.io

              # Khởi động Docker service
              systemctl start docker
              systemctl enable docker

              # Kéo các Docker images
              docker pull thuan410/nt114-frontend:v2
              docker pull thuan410/nt114-be-user:v2
              docker pull thuan410/nt114-be-board:v2
              docker pull thuan410/nt114-be-column:v2
              docker pull thuan410/nt114-be-card:v2
              docker pull thuan410/nt114-be-invitation:latest

              # Chạy Docker Run
              docker run -d --name frontend -p 3000:3000 thuan410/nt114-frontend:v2
              docker run -d --name be-user -p 3001:3001 thuan410/nt114-be-user:v2
              docker run -d --name be-board -p 3002:3002 thuan410/nt114-be-board:v2
              docker run -d --name be-column -p 3003:3003 thuan410/nt114-be-column:v2
              docker run -d --name be-card -p 3004:3004 thuan410/nt114-be-card:v2
              docker run -d --name be-invitation -p 3005:3005 thuan410/nt114-be-invitation:latest
              EOF

  tags = {
    Name = "thuantv-production-ec2"
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              # Tạo thư mục thuatv trong /
              mkdir -p /thuantv

              # Đăng nhập với quyền root
              sudo -i

              # Chuyển đến thư mục /thuatv
              cd /thuantv

              # Cập nhật danh sách gói
              apt update

              # Cài đặt Docker
              apt install -y docker.io

              # Khởi động Docker service
              systemctl start docker
              systemctl enable docker

              # Kéo các Docker images
              docker pull thuan410/nt114-frontend:v2
              docker pull thuan410/nt114-be-user:v2
              docker pull thuan410/nt114-be-board:v2
              docker pull thuan410/nt114-be-column:v2
              docker pull thuan410/nt114-be-card:v2
              docker pull thuan410/nt114-be-invitation:latest

              # Chạy Docker Run
              docker run -d --name frontend -p 3000:3000 thuan410/nt114-frontend:v2
              docker run -d --name be-user -p 3001:3001 thuan410/nt114-be-user:v2
              docker run -d --name be-board -p 3002:3002 thuan410/nt114-be-board:v2
              docker run -d --name be-column -p 3003:3003 thuan410/nt114-be-column:v2
              docker run -d --name be-card -p 3004:3004 thuan410/nt114-be-card:v2
              docker run -d --name be-invitation -p 3005:3005 thuan410/nt114-be-invitation:latest
              EOF

  tags = {
    Name = "thuantv-develops-ec2"
  }
}
