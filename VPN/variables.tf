variable "asn1" {
    type = string
    description = "autonomous system number for first router"
}
variable "asn2" {
    type = string
    description = "autonomous sytem number for second router"
  }
variable "network1" {
    type = string
    description = "first network for project1"
  }
variable "network2" {
    type = string
    description = "second network for project2"
  }
variable "gatewayname1" {
  type = string
  description = "gateway in project1"
}
variable "gatewayname2" {
  type = string
  description = "gateway for project2"
}
variable "routerregion" {
  type = string
  description = "region for router"
}
variable "network1router1" {
  type = string
  description = "router in netwrok 1"
}
variable "network2router2" {
  type = string
  description = "router in network 2"
}
variable "network1region1" {
  type = string
  description = "subnet1 in network1"
}
variable "network1region2" {
  type = string
  description = "subnet2 in network1"
}
variable "network2region1" {
  type = string
  description = "subnet1 in network2"
}
variable "network2region2" {
  type = string
  description = "subnet2 in network2"
}
variable "region1" {
    type = string
    description = "region"
  }
variable "region2" {
    type = string
    description = "region"
 }
variable "network1subnet1" {
  type = string
  description = "subnet1"
}
variable "network1subnet2" {
  type = string
  description = "subnet2"
}
variable "network2subnet1" {
  type = string
  description = "subnet3"
}
variable "network2subnet2" {
  type = string
  description = "subnet4"
}
variable "range1" {
  type = string
  description = "ipcidr"
}
variable "range2" {
  type = string
  description = "ipcidr"
}
variable "range3" {
  type = string
  description = "ipcidr"
}
variable "range4" {
  type = string
  description = "ipcidr"
}
variable "interface0tunnel1" {
  type = string
  description = "tunnel1"
}
variable "interface0tunnel2" {
  type = string
  description = "tunnel2"
}
variable "interface1tunnel1" {
  type = string
  description = "tunnel3"
}
variable "interface1tunnel2" {
  type = string
  description = "tunnel4"
}
variable "secret1" {
  type = string
  description = "shared secret"
}
variable "secret2" {
  type = string
  description = "shared secret"
}
variable "router1interface1" {
  type = string
  description = "r1i1"
}
variable "router1interface2" {
  type = string
  description = "r1i2"
}
variable "router2interface1" {
  type = string
  description = "r2i1"
}
variable "router2interface2" {
  type = string
  description = "r2i2"
}
variable "router1peer1" {
  type = string
  description = "r1p1"
}
variable "router1peer2" {
  type = string
  description = "r1p2"
}
variable "router2peer1" {
 type = string
 description = "r2p1" 
}
variable "router2peer2" {
  type = string
  description = "r2p2"
}
variable "projectid" {
  type = string
  description = "project id"
}