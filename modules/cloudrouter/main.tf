resource "google_compute_router" "router" {
  for_each = var.routers

  name    = each.value.name
  region  = each.value.region
  network = each.value.network
}
