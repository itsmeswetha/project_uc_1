resource "google_storage_bucket" "bucket" {
  name = var.bucketname
  location = var.bucketregion
}