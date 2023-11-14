
# Add a bucket as a CDN backend

resource "google_compute_backend_bucket" "backendbucket" {
  name = var.backendname
  bucket_name = google_storage_bucket.backend-for-cdn-lb.name
  description = "This is a backend bucket for CDN and LB"
  enable_cdn = true
}

# Bucket for the backend

resource "google_storage_bucket" "backend-for-cdn-lb" {
  name = var.bucketname
  location = var.bucketlocation
}

resource "google_storage_bucket_object" "static-website" {
  name = var.objname
 bucket = google_storage_bucket.backend-for-cdn-lb.name
 source = "../static_website/index.html"
}

resource "google_storage_object_access_control" "Website-access" {
  role = "READER"
  entity = "allUsers"
  object = google_storage_bucket_object.static-website.name
  bucket = google_storage_bucket.backend-for-cdn-lb.name
}
# Reserve a static external IP address

resource "google_compute_global_address" "ipforlb" {
  name          = "static-ip-for-lb" 
  }


# to create a DNS zone

resource "google_dns_managed_zone" "zone" {
  name          = var.zonename
  dns_name      = "stepupcloudengineer.in." #need to use fully qualified domain name.
  description   = "Domain name for lb ip"
  force_destroy = "true"
}
# to register web-server's ip address in DNS

resource "google_dns_record_set" "records" {
  name         = google_dns_managed_zone.zone.dns_name
  managed_zone = google_dns_managed_zone.zone.name
  type         = "A"
  ttl          = 300 #Time to live
  rrdatas = [google_compute_global_address.ipforlb.address]
}

# URL map

resource "google_compute_url_map" "urlmap" {
 name = var.urlmapname 
 default_service = google_compute_backend_bucket.backendbucket.self_link
 }

# Create a load balancer

resource "google_compute_target_http_proxy" "loadbalancer" {
  name = var.lbname
  url_map = google_compute_url_map.urlmap.self_link
}

# forwarding rule for load balancer

resource "google_compute_global_forwarding_rule" "lbrule" {
  name = var.rulename
  load_balancing_scheme = "EXTERNAL"
  ip_address = google_compute_global_address.ipforlb.address
  ip_protocol = "TCP"
  port_range = "80"
  target = google_compute_target_http_proxy.loadbalancer.self_link 
}