resource "google_compute_target_http_proxy" "this" {
  name    = var.name
  url_map = var.url_map_self_link
}
