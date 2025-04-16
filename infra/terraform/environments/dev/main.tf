module "ecr" {
  source   = "../../modules/ecr"
  name     = var.ecr_name
}

module "eks" {
  source       = "../../modules/dev-cluster"
  cluster_name = var.cluster_name
}