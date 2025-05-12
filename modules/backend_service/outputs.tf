output "backend_service_self_links" {
  value = {
    for k, bs in google_compute_backend_service.default : k => bs.self_link
  }
}
