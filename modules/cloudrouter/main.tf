terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_router" "router" {
  for_each = var.routers

  name    = each.value.name
  region  = each.value.region
  network = each.value.network
}
