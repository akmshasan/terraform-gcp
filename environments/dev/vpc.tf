module "vpc-dev" {
  source       = "../../modules/network"
  network_name = var.vpc_config_dev.network_name
  subnets      = var.vpc_config_dev.subnets
}

