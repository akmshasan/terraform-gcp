resource "google_compute_network_peering" "this" {
  provider             = google
  name                 = var.name
  network              = var.network_self_link
  peer_network         = var.peer_network_self_link
  peer_project         = var.peer_project_id
  export_custom_routes = true
  import_custom_routes = true
}
