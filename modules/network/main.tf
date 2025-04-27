resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  depends_on               = [resource.google_compute_network.vpc]
  for_each                 = var.subnets
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_cidr
  region                   = each.value.region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

