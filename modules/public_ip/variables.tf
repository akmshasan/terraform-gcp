variable "name" {
  description = "Name of the static IP"
  type        = string
}

variable "region" {
  description = "Region where IP should be created"
  type        = string
}

variable "address_type" {
  description = "Should always be EXTERNAL for public IP"
  type        = string
  default     = "EXTERNAL"

  validation {
    condition     = var.address_type == "EXTERNAL"
    error_message = "Only EXTERNAL address types are allowed (public IP)."
  }
}

variable "network_tier" {
  description = "Network tier for the IP (usually PREMIUM)"
  type        = string
  default     = "PREMIUM"
}
