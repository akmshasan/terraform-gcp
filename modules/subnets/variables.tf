variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name    = string
    cidr    = string
    region  = string
    network = string
  }))
}
