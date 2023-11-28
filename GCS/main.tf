# Creating a cloud storage bucket

resource "google_storage_bucket" "bucket" {
  name = var.bucketnametostoresf
  location = var.bucketlocationtostoresf
   storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  }

resource "google_storage_bucket_object" "statefile" {
  source = var.statefilesource
  name = var.objnameforsf
  bucket = google_storage_bucket.bucket.name
}
/*Storing the state file in the bucket
terraform {
 backend "gcs" {
   bucket  = var.bucketname
   prefix  = "terraform/state"
 }
}*/
