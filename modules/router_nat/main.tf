locals {
  # Auto-distribute subnets across NATs (round-robin)
  nats_subnet_mapping = {
    for idx, subnet_name in tolist(var.all_subnets) :
    subnet_name => keys(var.nats)[idx % length(keys(var.nats))]
  }

  # Create dynamic list of NAT External IPs
  nat_ip_addresses = flatten([
    for nat_key, nat_value in var.nats : [
      for ip_idx in range(nat_value.number_of_external_ips) : {
        nat_key  = nat_key
        ip_index = ip_idx
        name     = "${nat_key}-ip-${ip_idx}"
      }
    ]
  ])
}

# Create the Router
resource "google_compute_router" "router" {
  name    = var.router_config.router_name
  network = var.router_config.network
  region  = var.router_config.region
}

# Create External IPs
resource "google_compute_address" "nat_ip" {
  for_each = {
    for ip in local.nat_ip_addresses : ip.name => ip
  }

  name   = each.value.name
  region = var.router_config.region
}

# Create NAT Gateways
resource "google_compute_router_nat" "nat" {
  for_each = var.nats

  name   = each.value.nat_name
  router = google_compute_router.router.name
  region = var.router_config.region

  nat_ip_allocate_option = "MANUAL_ONLY"

  nat_ips = [
    for ip in google_compute_address.nat_ip : ip.self_link
    if startswith(ip.name, "${each.key}-ip-")
  ]

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  dynamic "subnetwork" {
    for_each = {
      for subnet_name, assigned_nat in local.nats_subnet_mapping :
      subnet_name => assigned_nat if assigned_nat == each.key
    }
    content {
      name                    = subnetwork.key
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }

  log_config {
    enable = true
    filter = each.value.log_filter
  }

  min_ports_per_vm = each.value.min_ports_per_vm

  depends_on = [
    google_compute_router.router
  ]
}

