variable "router_config" {
  description = "Router configuration"
  type = object({
    router_name = string
    region      = string
    network     = string
  })
}

variable "nats" {
  description = "Map of NAT configurations"
  type = map(object({
    nat_name               = string
    log_filter             = string
    number_of_external_ips = number
    min_ports_per_vm       = number
  }))
}

variable "all_subnets" {
  description = "List of all subnet names (auto-detected)"
  type        = list(string)
}

