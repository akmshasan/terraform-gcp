output "instance_self_links" {
  description = "Map of VM instance self-links"
  value = {
    for k, inst in google_compute_instance.vm : k => inst.self_link
  }
}

output "instance_names" {
  description = "Map of VM instance names"
  value = {
    for k, inst in google_compute_instance.vm : k => inst.name
  }
}

output "internal_ips" {
  description = "Map of VM internal IP addresses"
  value = {
    for k, inst in google_compute_instance.vm : k => inst.network_interface[0].network_ip
  }
}
