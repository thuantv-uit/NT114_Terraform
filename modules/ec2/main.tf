resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "thuantv-production-ec2"
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "thuantv-develops-ec2"
  }
}
