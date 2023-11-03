

# Creating a VPC

resource "google_compute_network" "network" {
  name = var.vpc_name
  routing_mode = GLOBAL
  auto_create_subnetworks = false
  mtu = 1460
  project = var.projectid
}


