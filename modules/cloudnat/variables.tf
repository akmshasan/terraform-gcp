variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "nats" {
  description = "Map of NAT configurations"
  type = map(object({
    name    = string
    region  = string
    router  = string
    nat_ips = optional(list(string))
  }))
}
