variable "record_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 300
}

variable "managed_zone" {
  type = string
}

variable "ip_address" {
  type = string
}
