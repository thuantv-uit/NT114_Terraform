resource "aws_security_group" "public_ec2" {
  vpc_id      = var.vpc_id
  name        = "thuantv-production-ec2"
  description = "Security Group cho Public EC2 instance"

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPs
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Frontend and Backend ports
  ingress {
    from_port   = 3000
    to_port     = 3005
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Hoặc giới hạn IP của bạn
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "thuantv-production-ec2"
  }
}

resource "aws_security_group" "private_ec2" {
  vpc_id      = var.vpc_id
  name        = "thuantv-develops-ec2"
  description = "Security Group cho Private EC2 instance"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "thuantv-develops-ec2"
  }
}
