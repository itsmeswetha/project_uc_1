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