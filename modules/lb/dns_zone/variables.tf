variable "name" {
  description = "Name of the Cloud DNS zone (Terraform resource name)"
  type        = string
}

variable "dns_name" {
  description = "DNS suffix (e.g., dev.example.com.)"
  type        = string
}

variable "description" {
  description = "Description of the zone"
  type        = string
  default     = ""
}
