output "nat_names" {
  description = "Map of NAT names"
  value = {
    for k, v in google_compute_router_nat.nat :
    k => v.name
  }
}

output "attached_nat_ips" {
  description = "Map of NATs to their attached static IPs"
  value = {
    for k, v in google_compute_router_nat.nat :
    k => v.nat_ips != null ? toset(v.nat_ips) : []
  }
}
