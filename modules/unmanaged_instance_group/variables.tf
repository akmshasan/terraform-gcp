variable "instance_groups" {
  description = "Map of unmanaged instance groups"
  type = map(object({
    name        = string
    description = optional(string, "")
    zone        = string
    instances   = list(string)
    network     = string
    named_ports = optional(list(object({
      name = string
      port = number
    })), [])
  }))
}
