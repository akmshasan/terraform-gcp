terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_compute_backend_service" "default" {
  for_each = var.backend_services

  name                  = each.value.name
  protocol              = "HTTP"
  port_name             = "http"
  timeout_sec           = 10
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [each.value.health_check]
  backend {
    group = each.value.instance_group
  }
}
