variable "credentials_file" {
  description = "Path to GCP credentials JSON file"
  type        = string
  default     = ""
}

variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "vpc_config_dev" {
  description = "VPC and subnet configuration for Dev"
  type = object({
    network_name = string
    subnets = map(object({
      subnet_name = string
      subnet_cidr = string
      region      = string
    }))
  })
}
