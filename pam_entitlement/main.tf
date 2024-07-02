terraform {
  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "5.36.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east"
  zone = var.zone
}