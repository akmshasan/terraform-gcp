variable "vpcs" {
  description = "Map of VPCs to create"
  type = map(object({
    name = string
  }))
}
