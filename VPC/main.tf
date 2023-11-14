

# Creating a VPC

resource "google_compute_network" "network" {
  name = var.vpcname1
  routing_mode = GLOBAL
  auto_create_subnetworks = false
  mtu = 1460
}


