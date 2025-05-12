terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_instance_group" "umig" {
  for_each = var.instance_groups

  name        = each.value.name
  description = each.value.description
  zone        = each.value.zone
  instances   = each.value.instances
  network     = each.value.network

  dynamic "named_port" {
    for_each = try(each.value.named_ports, [])
    content {
      name = named_port.value.name
      port = named_port.value.port
    }
  }
}
