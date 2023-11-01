terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

provider "google" {
  # Configuration options
}

# Creating a VPC

resource "google_compute_network" "network" {
  name = var.vpc_name
}

# Creating a subnet

resource "google_compute_subnetwork" "network-subnet" {
  name = var.subnet_name
  region = var.subnet_region
  network = google_compute_network.network
  ip_cidr_range = var.subnet_cidr
}

# Creating a firewall rule

resource "google_compute_firewall" "network-firewall" {
  name = var.firewall_name
  network = google_compute_network.network
  target_tags = var.target_tag  
  source_ranges = var.source_ranges
  source_tags = var.source_tags

  allow {
    protocol = var.proto
    ports    = var.port
  }
}

