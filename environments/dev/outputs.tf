output "vpc_networks" {
  description = "List of created VPC networks"
  value       = module.vpc.vpc_network
}

output "subnet_ids" {
  description = "Self-links of created subnets"
  value       = module.subnets.subnet_ids
}

output "router_names" {
  description = "Names of created Cloud Routers"
  value       = module.cloudrouter.router_names
}

output "router_self_links" {
  description = "Self-links of Cloud Routers"
  value       = module.cloudrouter.router_self_links
}

output "nat_names" {
  description = "Names of created Cloud NATs"
  value       = module.cloudnat.nat_names
}

output "cloudnat_attached_ips" {
  value = module.cloudnat.attached_nat_ips
}
