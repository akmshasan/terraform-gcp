terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_router_nat" "nat" {
  for_each = var.nats

  name   = each.value.name
  region = each.value.region
  router = each.value.router

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  nat_ip_allocate_option = (
    length(lookup(each.value, "nat_ips", [])) > 0
    ? "MANUAL_ONLY"
    : "AUTO_ONLY"
  )

  # only assign if we have static IP names
  nat_ips = length(lookup(each.value, "nat_ips", [])) > 0 ? [
    for ip_name in lookup(each.value, "nat_ips", []) :
    "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${each.value.region}/addresses/${ip_name}"
  ] : null

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
