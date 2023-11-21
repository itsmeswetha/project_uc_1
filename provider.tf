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
  project = var.projectid
  region = var.projectregion
  #credentials = file("key.json")
}