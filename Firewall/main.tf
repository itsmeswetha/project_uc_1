# Creating a firewall rule

resource "google_compute_firewall" "network-firewall" {
  name = var.firewall_name
  network = var.networkname
  target_tags = var.targettag  
  source_tags = var.sourcetags

  allow {
    protocol = "tcp"
    ports    = var.tcpports
  }
  allow {
 protocol = "icmp"
  }
}

