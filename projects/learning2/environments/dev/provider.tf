terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.29"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.29"
    }
  }
}

provider "google" {
  # Configuration options
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  # Configuration options
  project = var.project_id
  region  = var.region
}

provider "google" {
  project = var.primary_project
  alias   = "primary"
  region  = var.region
}

provider "google" {
  project = var.secondary_project
  alias   = "secondary"
  region  = var.region
}
