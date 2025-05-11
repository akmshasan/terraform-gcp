output "subnet_ids" {
  description = "Map of Subnet self_links"
  value = {
    for k, v in google_compute_subnetwork.subnets :
    k => v.self_link
  }
}
