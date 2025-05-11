terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.29"
    }
  }
}

resource "google_service_account" "sa" {
  for_each = var.service_accounts

  account_id   = each.value.account_id
  display_name = each.value.display_name
  description  = each.value.description
}

locals {
  sa_roles = {
    for sa_key, sa in var.service_accounts :
    sa_key => [
      for role in sa.roles : {
        role   = role
        sa_key = sa_key
      }
    ]
  }

  flattened_sa_roles = {
    for entry in flatten([
      for sa_key, roles in local.sa_roles : [
        for r in roles : {
          sa_key = r.sa_key
          role   = r.role
          key    = "${r.sa_key}-${replace(r.role, "roles/", "")}"
        }
      ]
      ]) : entry.key => {
      sa_key = entry.sa_key
      role   = entry.role
    }
  }
}

resource "google_project_iam_member" "sa_roles" {
  for_each = local.flattened_sa_roles

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.sa[each.value.sa_key].email}"
}
