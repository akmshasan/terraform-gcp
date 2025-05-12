resource "google_dns_record_set" "this" {
  name         = var.record_name
  type         = "A"
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = [var.ip_address]
}
