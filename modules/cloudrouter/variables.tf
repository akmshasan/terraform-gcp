variable "routers" {
  description = "Map of Cloud Routers to create"
  type = map(object({
    name    = string
    region  = string
    network = string
  }))
}
