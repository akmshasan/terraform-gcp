resource "google_compute_address" "this" {
  name         = var.name
  region       = var.region
  address_type = var.address_type
  network_tier = var.network_tier

  lifecycle {
    prevent_destroy = false
  }
}
