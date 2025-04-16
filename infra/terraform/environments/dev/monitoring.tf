module "monitoring" {
  source       = "../../modules/monitoring"
  cluster_name = module.eks.cluster_name
  alert_email  = "gorojas92@gmail.com"
}
