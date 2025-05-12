resource "google_compute_url_map" "this" {
  name            = var.name
  default_service = var.default_backend_service
}
