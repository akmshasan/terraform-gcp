output "health_check_self_links" {
  value = {
    for k, hc in google_compute_health_check.http : k => hc.self_link
  }
}
