terraform {
  backend "gcs" {
    bucket = "learning-gcs-tfstate"
    prefix = "learning/dev"
  }
}
