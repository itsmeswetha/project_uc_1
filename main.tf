# Creating modules to build all the instances at the same time

/*********************************
   Storing statefile in bucket
**********************************/
#Storing the state file in the bucket
terraform {
 backend "gcs" {
   bucket  = "sceg-buck-for-sf-187625"
   prefix  = "terraform/state"
 }
}
/*********************************
         VPC Configuration
**********************************/         

module "VPC"{
source = "./VPC"
vpcname1 = var.firstvpcname
}

/*********************************
     Subnet Configuration            
**********************************/

module "subnet"{
    source = "./Subnet"
    networksubnet = module.VPC.network-1
    subnetcidr1 = var.subnetipinfirstvpc
    subnetname1 = var.subnetnameinfirstvpc
    subnetregion1 = var.regionoffirstvpcsubnet
}

/*********************************
      Firewall Configuration
**********************************/
module "firewallrule"{
    source = "./Firewall"
    firewall_name = var.firewallinfirstvpc
    targettag = var.targetvmtags
    vpcname1 = module.VPC.network-1
    tcpports = var.portstoallow
    sourceranges = var.allowthesourceip
}

/***********************************
       VPN Configuration
************************************/

module "vpn" {
    source = "./VPN"
  range1 = var.cidrforsubnet1
  range2 = var.cidrforsubnet2
  range3 = var.cidrforsubnet3
  range4 = var.cidrforsubnet4
  asn1 = var.asnforrouter1
  asn2 = var.asnforrouter2
  interface0tunnel1 = var.tunnel00
  interface0tunnel2 = var.tunnel01
  interface1tunnel1 = var.tunnel11
  interface1tunnel2 = var.tunnel12
  network1 = var.vpcnetworkname1
  network2 = var.vpcnetworkname2
  network1subnet1 = var.subnet1nameinnet1
  network1subnet2 = var.subnet2nameinnet1
  network2subnet1 = var.subnet1nameinnet2
  network2subnet2 = var.subnet2nameinnet2
  network1region1 = var.subnet11region1
  network1region2 = var.subnet21region2
  network2region1 = var.subnet12region1
  network2region2 = var.subnet22region2
  router1interface1 = var.bgpinterface11
  router1interface2 = var.bgpinterface12
  router1peer1 = var.bgppeer11
  router1peer2 = var.bgppeer12
  router2interface1 = var.bgpinterface21
  router2interface2 = var.bgpinterface22
  router2peer1 = var.bgppeer21
  router2peer2 = var.bgppeer22
  gatewayname1 = var.gatewaynameinvpc1
  gatewayname2 = var.gatewaynameinvpc2
  network1router1 = var.routername1
  network2router2 = var.routername2
  region1 = var.gateway1region
  region2 = var.gateway2region
  routerregion = var.regionforbothrouters
  secret1 = var.sharedsecretkey1
  secret2 = var.sharedsecretkey2
  project1 = var.projectfornetwork1
  project2 = var.projectfornetwork2
}

/*********************************
     Router Configuration
**********************************/

module "router" {
  source = "./Cloud_Router"
  routername = var.routername3
  routerregion = var.routerregion3
  asn3 = var.asnforrouter3
  vpcforrouter = module.VPC.network-1
}

/***********************************
     DNS, LB and CDN
************************************/

module "lb" {
  source = "./Cloud_LB"
  backendname = var.cdnlbbackendname
  zonename = var.managedzonename
  urlmapname = var.urlmapnameforproxy
  objname = var.objnameforhtml
  bucketname = var.bucketname2forwebsite
  bucketlocation = var.bucketlocationforwebsite
  rulename = var.gforwardrulename
  lbname = var.targethttpproxyname
}

/***************************************
             IAM
****************************************/
module "iam"{
  source = "./IAM"
  service_account_display_name = var.sadisplay-name
  service_account_id = var.said 
  role1 = var.role1sa
  role2 = var.role2sa
  role3 = var.role3sa
  role4 = var.role4sa
}             