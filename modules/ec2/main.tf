resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instances_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = var.key_name

  user_data = file("${path.module}/script-production.sh")
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

  user_data = file("${path.module}/script-development.sh")

  tags = {
    Name = "thuantv-develops-ec2"
  }
}
