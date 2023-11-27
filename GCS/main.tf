# Creating a cloud storage bucket

resource "google_storage_bucket" "bucket" {
  name = "sceg-buck-for-sf-397"
  location = "US"
   storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  }

/*Storing the state file in the bucket
terraform {
 backend "gcs" {
   bucket  = var.bucketname
   prefix  = "terraform/state"
 }
}*/
