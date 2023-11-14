# Creating a subnet

resource "google_compute_subnetwork" "network-subnet" {
  name = var.subnetname1
  region = var.subnetregion1
  network = var.networksubnet
  ip_cidr_range = var.subnetcidr1
}
