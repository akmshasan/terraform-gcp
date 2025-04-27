terraform {
  required_version = "~> 1.11.3"

  backend "gcs" {
    bucket = "learning-gcs-tfstate"
    prefix = "env/dev"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.32.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.32.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}
