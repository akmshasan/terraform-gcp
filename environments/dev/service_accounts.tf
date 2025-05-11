module "service_accounts" {
  source     = "../../modules/service_account"
  project_id = var.project_id

  service_accounts = {
    "dev-app-sa" = {
      account_id   = "dev-app-sa"
      display_name = "Dev App Service Account"
      description  = "Service account for application in dev environment"
      roles = [
        "roles/logging.logWriter",
        "roles/monitoring.metricWriter",
        "roles/compute.admin"
      ]
    },
    "dev-batch-sa" = {
      account_id   = "dev-batch-sa"
      display_name = "Dev Batch Processor SA"
      description  = "Service account for batch jobs in dev"
      roles = [
        "roles/storage.objectViewer"
      ]
    }
  }
}
