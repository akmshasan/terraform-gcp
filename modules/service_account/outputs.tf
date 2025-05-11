output "service_account_emails" {
  description = "Map of service account emails created by this module"
  value = {
    for k, sa in google_service_account.sa : k => sa.email
  }
}

output "service_account_names" {
  description = "Map of full service account resource names"
  value = {
    for k, sa in google_service_account.sa : k => sa.name
  }
}
