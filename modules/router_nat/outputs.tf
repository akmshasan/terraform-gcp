output "router_name" {
  value = google_compute_router.router.name
}

output "nat_names" {
  value = { for k, nat in google_compute_router_nat.nat : k => nat.name }
}

output "nat_ips" {
  value = { for k, ip in google_compute_address.nat_ip : k => ip.address }
}

