# Creating a cloud storage bucket

resource "google_storage_bucket" "bucket" {
  name = var.bucketname
  location = var.bucketregion
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.terraform_state_bucket.id
  }
}

#Storing the state file in the bucket
terraform {
 backend "gcs" {
   bucket  = var.bucketname
   prefix  = "terraform/state"
 }
}
