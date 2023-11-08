

# to create a DNS zone

resource "google_dns_managed_zone" "zone" {
  name          = var.zonename
  dns_name      = "StepUpCloudEngineer.In" 
  description   = "Domain name for lb ip"
  force_destroy = "true"
}

# to register web-server's ip address in DNS

resource "google_dns_record_set" "records" {
  name         = google_dns_managed_zone.zone.dns_name
  managed_zone = google_dns_managed_zone.zone.name
  type         = "A"
  ttl          = 300
  rrdatas = [
    
  ]
}