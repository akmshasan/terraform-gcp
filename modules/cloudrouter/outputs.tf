output "router_names" {
  description = "Map of Cloud Router names"
  value = {
    for k, v in google_compute_router.router :
    k => v.name
  }
}

output "router_self_links" {
  description = "Map of Cloud Router self_links"
  value = {
    for k, v in google_compute_router.router :
    k => v.self_link
  }
}
