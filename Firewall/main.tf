# Creating a firewall rule

resource "google_compute_firewall" "network-firewall" {
  name = var.firewall_name
  network = var.vpcname1
  target_tags = var.targettag  
  source_ranges = var.sourceranges

  allow {
    protocol = "tcp"
    ports    = var.tcpports
  }
  allow {
 protocol = "icmp"
  }
}

