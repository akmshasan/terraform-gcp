resource "google_dns_managed_zone" "this" {
  name        = var.name
  dns_name    = var.dns_name # Must end with a dot, e.g. "dev.example.com."
  description = var.description
}
