module "vpc-prod" {
  source       = "../../modules/network"
  network_name = var.vpc_config_prod.network_name
  subnets      = var.vpc_config_prod.subnets
}


