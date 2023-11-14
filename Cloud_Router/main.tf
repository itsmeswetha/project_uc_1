# Creating a Router

resource "google_compute_router" "router1" {
  name    = var.routername
  region  = var.routerregion
  network = var.vpcforrouter
  bgp {
    asn = var.asn3
  }
}
