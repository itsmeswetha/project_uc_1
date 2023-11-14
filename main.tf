# Creating modules to build all the instances at the same time

/*********************************
   Storing statefile in bucket
**********************************/
module "gcs"{
    source = "./GCS"
    projectid = var.projectid1
    bucketregion = var.bucketregion1
    bucketname = var.bucketname1
}

/*********************************
         VPC Configuration
**********************************/         

module "VPC"{
source = "./VPC"
vpc_name = var.vpcname
projectid = provider.google.project
defaultprojectregion = provider.google.region
}

/*********************************
     Subnet Configuration            
**********************************/

module "subnet"{
    source = "./Subnet"
    project-id = provider.google.project
    networksubnet = module.VPC.name
    subnet_cidr = var.subnetip
    subnet_name = var.subnetname
    subnet_region = var.subnetregion
}

/*********************************
      Firewall Configuration
**********************************/
module "firewallrule"{
    source = "./Firewall"
    targettag = var.targettag
    sourcetags = var.sourcetag
    source_ranges = var.sourceranges
    networkname = module.VPC.name
    firewall_name = var.firewallname
    tcpports = var.tcpports
}      

/***********************************
       VPN Configuration
************************************/

module "vpn" {
    source = "./VPN"
  range1 = var.range1
  range2 = var.range2
  range3 = var.range3
  range4 = var.range4
  asn1 = var.asn1
  asn2 = var.asn2
  interface0tunnel1 = var.interface0tunnel1
  interface0tunnel2 = var.interface0tunnel2
  interface1tunnel1 = var.interface1tunnel1
  interface1tunnel2 = var.interface1tunnel2
  network1 = var.network1
  network2 = var.network2
  network1subnet1 = var.network1subnet1
  network1subnet2 = var.network1subnet2
  network2subnet1 = var.network2subnet1
  network2subnet2 = var.network2subnet2
  network1region1 = var.network1region1
  network1region2 = var.network1region2
  network2region1 = var.network2region1
  network2region2 = var.network2region2
  router1interface1 = var.router1interface1
  router1interface2 = var.router2interface2
  router1peer1 = var.router1peer1
  router1peer2 = var.router1peer2
  router2interface1 = var.router2interface1
  router2interface2 = var.router2interface2
  router2peer1 = var.router2peer1
  router2peer2 = var.router2peer2
  gatewayname1 = var.gatewayname1
  gatewayname2 = var.gatewayname2
  network1router1 = var.network1router1
  network2router2 = var.network2router2
  region1 = var.region1
  region2 = var.region2
  routerregion = var.routerregion
  secret1 = var.secret1
  secret2 = var.secret2
  projectid = var.projectid
  project1 = var.project1
  project2 = var.project2
}

/*********************************
     Router Configuration
**********************************/

module "router" {
  source = "./Cloud_Router"
  network1router1 = module.VPC.name
  routerregion = var.routerregion3
  asn3 = var.asn3
}

/***********************************
     DNS, LB and CDN
************************************/

module "lb" {
  source = "./Cloud_LB"
  backendname = var.backendname
  project_id = provider.google.project
  zonename = var.zonename
  urlmapname = var.urlmapname
  objname = var.objname
  bucketname = var.bucketname
  bucketlocation = var.bucketlocation
  rulename = var.rulename
  lbname = var.lbname
}