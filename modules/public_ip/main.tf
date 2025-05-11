terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_address" "this" {
  name         = var.name
  region       = var.region
  address_type = var.address_type
  network_tier = var.network_tier

  lifecycle {
    prevent_destroy = false
  }
}
