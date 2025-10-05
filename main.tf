module "network" {
  source               = "./modules/network"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security" {
  source      = "./modules/security"
  environment = var.environment
  vpc_id      = module.network.vpc_id
}

module "compute" {
  source                    = "./modules/compute"
  environment               = var.environment
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  private_subnet_ids        = module.network.private_subnet_ids
  public_subnet_ids         = module.network.public_subnet_ids
  key_pair_name             = var.key_pair_name
  ec2_instance_profile_name = module.security.ec2_instance_profile_name
  web_sg_id                 = module.security.web_sg_id
}

module "loadbalancer" {
  source                    = "./modules/loadbalancer"
  environment               = var.environment
  vpc_id                    = module.network.vpc_id
  public_subnet_ids         = module.network.public_subnet_ids
  private_subnet_ids        = module.network.private_subnet_ids
  web_sg_id                 = module.security.web_sg_id
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  ec2_instance_profile_name = module.security.ec2_instance_profile_name
}

module "storage" {
  source              = "./modules/storage"
  environment         = var.environment
  private_subnet_ids  = module.network.private_subnet_ids
  db_sg_id            = module.security.db_sg_id
  ec2_role_arn        = module.security.ec2_role_arn
}