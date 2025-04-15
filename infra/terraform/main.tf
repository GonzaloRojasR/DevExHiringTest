provider "aws" {
  region = var.region
}

module "ecr" {
  source   = "../modules/ecr"
  ecr_name = var.ecr_name
}

module "dev" {
  source       = "../modules/dev-cluster"
  cluster_name = "gr-dev-cluster"
}
