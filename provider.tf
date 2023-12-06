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

#Storing the state file in the bucket
terraform {
 backend "gcs" {
   bucket  = "sceg-buck-for-sf-827"
   prefix  = "terraform/state"
 }
}