variable "network_name" {
  type        = string
  description = "Name of the VPC network."
}

variable "subnets" {
  type = map(object({
    subnet_name = string
    subnet_cidr = string
    region      = string
  }))
}

