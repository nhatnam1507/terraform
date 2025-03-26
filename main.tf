module "security_group" {
  source = "./modules/security_group"

  vpc_id      = var.vpc_id
  environment = var.environment
  tags        = var.tags
}

module "ec2_instance" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_group.security_group_id
  subnet_id         = var.subnet_id
  environment       = var.environment
  tags              = var.tags
} 