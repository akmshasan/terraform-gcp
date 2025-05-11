terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_network" "vpc_network" {
  for_each                = var.vpcs
  name                    = each.value.name
  auto_create_subnetworks = false
}
