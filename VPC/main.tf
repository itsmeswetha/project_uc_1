

# Creating a VPC

resource "google_compute_network" "network" {
  name = var.vpc_name
  routing_mode = Global
  auto_create_subnetworks = false
}


