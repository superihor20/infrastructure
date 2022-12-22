provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Owner   = "Ihor Naidonov"
      Project = "Naidonov Production"
    }
  }
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

  vpc_id = module.vpc.id

  depends_on = [
    module.vpc
  ]
}