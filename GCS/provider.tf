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
  project = "arboreal-path-397504"
  region = "us_central1"
  credentials = file("key.json")
}