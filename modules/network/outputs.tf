output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "subnet_self_links" {
  value = { for key, subnet in google_compute_subnetwork.subnet : key => subnet.self_link }
}

output "network_self_link" {
  value = google_compute_network.vpc.self_link
}
