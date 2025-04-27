data "google_compute_subnetworks" "all" {
  project = var.project_id
  region  = var.region
  filter  = "network eq ${module.vpc-prod.network_self_link}"
}

locals {
  discovered_subnets = [for s in data.google_compute_subnetworks.all.subnetworks : s.name]
}

# Call the router_nat module
module "router_nat" {
  source = "../../modules/router_nat"

  router_config = {
    router_name = "learning-router-prod"
    region      = var.region
    network     = module.vpc-prod.network_self_link
  }

  all_subnets = local.discovered_subnets

  nats = {
    nat-ha-prod-1 = {
      nat_name               = "learning-nat-prod-ha-1"
      log_filter             = "ALL"
      number_of_external_ips = 2
      min_ports_per_vm       = 128
    }
    nat-ha-prod-2 = {
      nat_name               = "learning-nat-prod-ha-2"
      log_filter             = "ALL"
      number_of_external_ips = 2
      min_ports_per_vm       = 64
    }
  }

  depends_on = [
    module.vpc-prod
  ]
}


