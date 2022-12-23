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