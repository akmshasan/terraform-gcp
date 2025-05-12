variable "name" {
  type        = string
  description = "Name of the URL map"
}

variable "default_backend_service" {
  type        = string
  description = "Self-link to the default backend service"
}
