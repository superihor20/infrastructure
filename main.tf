provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Owner   = "Ihor Naidonov"
      Project = "NaidonovProduction"
    }
  }
}

module "aws_vpc" {
  source = "./modules/vpc"
}