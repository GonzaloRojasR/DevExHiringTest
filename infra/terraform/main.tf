provider "aws" {
  region = var.region
}

module "dev" {
  source    = "./environments/dev"
  ecr_name  = var.ecr_name
}