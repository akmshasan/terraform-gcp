# Auto-fetch all subnets under the VPC
data "google_compute_subnetworks" "all" {
  project = var.project_id
  region  = var.region
  filter  = "network eq ${module.vpc-dev.network_self_link}"
}

locals {
  discovered_subnets = [for s in data.google_compute_subnetworks.all.subnetworks : s.name]
}

# Call the router_nat module
module "router_nat" {
  source = "../../modules/router_nat"

  router_config = {
    router_name = "learning-router-dev"
    region      = var.region
    network     = module.vpc-dev.network_self_link
  }

  all_subnets = local.discovered_subnets

  nats = {
    nat-ha-1 = {
      nat_name               = "learning-nat-ha-1"
      log_filter             = "ALL"
      number_of_external_ips = 2
      min_ports_per_vm       = 128
    }
    nat-ha-2 = {
      nat_name               = "learning-nat-ha-2"
      log_filter             = "ALL"
      number_of_external_ips = 2
      min_ports_per_vm       = 64
    }
  }

  depends_on = [
    module.vpc-dev
  ]
}

