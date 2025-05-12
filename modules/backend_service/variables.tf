variable "backend_services" {
  type = map(object({
    name           = string
    instance_group = string
    health_check   = string
  }))
}
