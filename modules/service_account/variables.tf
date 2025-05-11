variable "project_id" {
  description = "GCP project ID where the service accounts will be created"
  type        = string
}

variable "service_accounts" {
  description = "Map of service accounts and their configurations"
  type = map(object({
    account_id   = string
    display_name = string
    description  = string
    roles        = list(string)
  }))
}
