provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Owner   = "Ihor Naidonov"
      Project = "Naidonov Production"
    }
  }
}

module "global_variables" {
  source = "./modules/global-variables"
}

module "vpc" {
  source = "./modules/vpc"
}

module "internet_gateway" {
  source = "./modules/internet-gateway"

  vpc_id = module.vpc.id

  depends_on = [
    module.vpc
  ]
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id        = module.vpc.id
  subnet_amount = module.global_variables.subnet_amount

  depends_on = [
    module.vpc,
    module.global_variables
  ]
}

module "route_table" {
  source = "./modules/route-table"

  vpc_id             = module.vpc.id
  igw_id             = module.internet_gateway.id
  subnet_amount      = module.global_variables.subnet_amount
  public_subnet_ids  = module.subnet.public_subnet_ids
  private_subnet_ids = module.subnet.private_subnet_ids

  depends_on = [
    module.vpc,
    module.internet_gateway,
    module.global_variables,
    module.subnet
  ]
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id = module.vpc.id
  my_ip  = var.my_ip

  depends_on = [
    module.vpc,
    var.my_ip
  ]
}

module "db_instance" {
  source = "./modules/database"

  db_subnet_group_id    = module.subnet.db_subnet_group_id
  db_security_group_ids = module.security_group.db_security_group_ids

  depends_on = [
    module.subnet,
    module.security_group
  ]
}

module "key_pairs_ec2" {
  source = "./modules/key-pair"
}

module "instances" {
  source = "./modules/instance"

  public_subnets         = module.subnet.public_subnet_ids
  key_name               = module.key_pairs_ec2.key_name
  web_security_group_ids = module.security_group.web_security_group_ids

  depends_on = [
    module.subnet,
    module.key_pairs_ec2,
    module.security_group
  ]
}

module "eip" {
  source = "./modules/elastic-ip"

  instance_ids  = module.instances.instance_ids
  web_instances = module.instances.web_instances

  depends_on = [
    module.instances
  ]
}