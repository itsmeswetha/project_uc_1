# Creating a firewall rule

resource "google_compute_firewall" "network-firewall" {
  name = var.firewall_name
  network = google_compute_network.network
  target_tags = var.target_tag  
  source_ranges = var.source_ranges
  source_tags = var.source_tags

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22","1000-2000"]
  }
  allow {
 protocol = "icmp"
  }
}

