# Creating a Router

resource "google_compute_router" "router1" {
  name    = var.network1router1
  region  = var.routerregion
  network = module.VPC.google_compute_network.network.name
  bgp {
    asn = var.asn1
  }
}

module "VPC" {
  source = "/home/swethaManasa/Documents/Project_us_1/VPC"
}