output "vpc_networks" {
  description = "List of created VPC networks"
  value       = module.vpc.vpc_network
}

output "subnet_ids" {
  description = "Self-links of created subnets"
  value       = module.subnets.subnet_ids
}
