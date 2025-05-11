variable "instances" {
  description = "Map of VM instances to create"
  type = map(object({
    name                        = string
    zone                        = string
    machine_type                = string
    tags                        = optional(list(string), [])
    metadata                    = optional(map(string), {})
    network                     = string
    subnetwork                  = string
    internal_ip                 = string
    service_account             = string
    scopes                      = list(string)
    labels                      = optional(map(string), {})
    enable_secure_boot          = optional(bool, true)
    enable_vtpm                 = optional(bool, true)
    enable_integrity_monitoring = optional(bool, true)
  }))
}
