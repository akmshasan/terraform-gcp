terraform {
  required_version = "~> 1.11.3"

  backend "gcs" {
    bucket = "learning-gcs-tfstate"
    prefix = "env/prod"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.32"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.32"
    }
  }
}

provider "google" {
  credentials = var.credentials_file != "" ? file(var.credentials_file) : null
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = var.credentials_file != "" ? file(var.credentials_file) : null
  project     = var.project_id
  region      = var.region
}

