module "ecr" {
  source   = "../../modules/ecr"
  ecr_name = var.ecr_name
}

module "eks" {
  source       = "../../modules/dev-cluster"
  cluster_name = var.cluster_name
}