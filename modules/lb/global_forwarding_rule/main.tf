resource "google_compute_global_forwarding_rule" "this" {
  name       = var.name
  ip_address = var.ip_address
  port_range = var.port_range
  target     = var.target_proxy
}
