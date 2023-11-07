# Creating a subnet

resource "google_compute_subnetwork" "network-subnet" {
  name = var.subnet_name
  region = var.subnet_region
  network = var.networksubnet
  ip_cidr_range = var.subnet_cidr
}
