# Add a bucket as a CDN backend

resource "google_compute_backend_bucket" "backendbucket" {
  name = var.backendname
  bucket_name = google_storage_bucket.backend-for-cdn-lb.name
  description = "This backend bucket will contain a static website"
  enable_cdn = true
}

# Bucket for the backend

resource "google_storage_bucket" "backend-for-cdn-lb" {
  name = var.bucketname
  location = var.bucketlocation
}

resource "google_compute_url_map" "urlmap" {
 name = var.urlmapname 
 default_service = google_compute_backend_bucket.backendbucket.name
}

# Create a load balancer

resource "google_compute_target_http_proxy" "loadbalancer" {
  name = var.lbname
  url_map = google_compute_url_map.urlmap.name
}