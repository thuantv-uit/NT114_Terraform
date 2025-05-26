# Tạo cặp khóa SSH
resource "tls_private_key" "nt548_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "nt548_key" {
  key_name   = "thuantv"
  public_key = tls_private_key.nt548_key.public_key_openssh
}

# Lưu khóa riêng vào file .pem
resource "local_file" "nt548_key_pem" {
  content         = tls_private_key.nt548_key.private_key_pem
  filename        = "./thuantv.pem"
  file_permission = "0400"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  region              = var.region
}

module "security_groups" {
  source         = "./modules/security_groups"
  vpc_id         = module.vpc.vpc_id
  allowed_ssh_ip = var.allowed_ssh_ip
}

module "ec2" {
  source            = "./modules/ec2"
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  public_sg_id      = module.security_groups.public_sg_id
  private_sg_id     = module.security_groups.private_sg_id
  ami_id            = var.ami_id
  instances_type    = var.instances_type
  key_name          = aws_key_pair.nt548_key.key_name
}

module "s3_state" {
  source              = "./modules/s3_state"
  state_bucket_name   = var.state_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}
