terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_subnetwork" "subnets" {
  for_each      = var.subnets
  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = each.value.network
}
