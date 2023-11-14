terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = var.project-id
  region = "us_central1"
  credentials = file("key.json")
}