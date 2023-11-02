resource "google_compute_ha_vpn_gateway" "ha_gateway1" {
  region  = var.region1
  name    = var.gatewayname1
  network = google_compute_network.network1.id
}

resource "google_compute_ha_vpn_gateway" "ha_gateway2" {
  region  = var.region2
  name    = var.gatewayname2
  network = google_compute_network.network2.id
}

resource "google_compute_network" "network1" {
  name                    = var.network1
  routing_mode            = "Global"
  auto_create_subnetworks = false
}

resource "google_compute_network" "network2" {
  name                    = var.network2
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network1_subnet1" {
  name          = var.network1subnet1
  ip_cidr_range = var.range1
  region        = var.network1region1
  network       = google_compute_network.network1.id
}

resource "google_compute_subnetwork" "network1_subnet2" {
  name          = var.network1subnet2
  ip_cidr_range = var.range2
  region        = var.network1region2
  network       = google_compute_network.network1.id
}

resource "google_compute_subnetwork" "network2_subnet1" {
  name          = var.network2subnet1
  ip_cidr_range = var.range3
  region        = var.network2region1
  network       = google_compute_network.network2.id
}

resource "google_compute_subnetwork" "network2_subnet2" {
  name          = var.network2subnet2
  ip_cidr_range = var.range4
  region        = var.network2region2
  network       = google_compute_network.network2.id
}

resource "google_compute_router" "router1" {
  name    = var.network1router1
  region  = var.routerregion
  network = google_compute_network.network1.name
  bgp {
    asn = var.asn1
  }
}

resource "google_compute_router" "router2" {
  name    = var.network2router2
  region  = var.routerregion
  network = google_compute_network.network2.name
  bgp {
    asn = var.asn2
  }
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  name                  = var.interface0tunnel1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway1.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway2.id
  shared_secret         = var.secret1
  router                = google_compute_router.router1.id
  vpn_gateway_interface = 0
}

resource "google_compute_vpn_tunnel" "tunnel2" {
  name                  = var.interface1tunnel1
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway1.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway2.id
  shared_secret         = var.secret2
  router                = google_compute_router.router1.id
  vpn_gateway_interface = 1
}

resource "google_compute_vpn_tunnel" "tunnel3" {
  name                  = var.interface0tunnel2
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway2.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway1.id
  shared_secret         = var.secret1
  router                = google_compute_router.router2.id
  vpn_gateway_interface = 0
}

resource "google_compute_vpn_tunnel" "tunnel4" {
  name                  = var.interface1tunnel2
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_gateway2.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_gateway1.id
  shared_secret         = var.secret2
  router                = google_compute_router.router2.id
  vpn_gateway_interface = 1
}

resource "google_compute_router_interface" "router1_interface1" {
  name       = var.router1interface1
  router     = google_compute_router.router1.name
  ip_range   = "169.254.0.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1.name
}

resource "google_compute_router_peer" "router1_peer1" {
  name                      = var.router1peer1
  router                    = google_compute_router.router1.name
  peer_ip_address           = "169.254.0.2"
  peer_asn                  = var.asn2
  interface                 = google_compute_router_interface.router1_interface1.name
}

resource "google_compute_router_interface" "router1_interface2" {
  name       = var.router1interface2
  router     = google_compute_router.router1.name
  ip_range   = "169.254.1.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel2.name
}

resource "google_compute_router_peer" "router1_peer2" {
  name                      = var.router1peer2
  router                    = google_compute_router.router1.name
  peer_ip_address           = "169.254.1.1"
  peer_asn                  = var.asn2
  interface                 = google_compute_router_interface.router1_interface2.name
}

resource "google_compute_router_interface" "router2_interface1" {
  name       = var.router2interface1
  router     = google_compute_router.router2.name
  ip_range   = "169.254.0.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel3.name
}

resource "google_compute_router_peer" "router2_peer1" {
  name                      = var.router2peer1
  router                    = google_compute_router.router2.name
  peer_ip_address           = "169.254.0.1"
  peer_asn                  = var.asn1
  interface                 = google_compute_router_interface.router2_interface1.name
}

resource "google_compute_router_interface" "router2_interface2" {
  name       = var.router2interface2
  router     = google_compute_router.router2.name
  ip_range   = "169.254.1.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel4.name
}

resource "google_compute_router_peer" "router2_peer2" {
  name                      = var.router2peer2
  router                    = google_compute_router.router2.name
  peer_ip_address           = "169.254.1.2"
  peer_asn                  = var.asn1
  interface                 = google_compute_router_interface.router2_interface2.name
}