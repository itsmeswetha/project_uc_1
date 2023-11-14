# Variables values for provider

projectid = "arboreal-path-397504"
  
projectregion = "us-central1"

# Variables values for GCS

bucketregion1forsf = "US"  

bucketname1forsf = "sceg-buck-for-sf-827"

# Variables values for VPC

firstvpcname = "vpc1-for-sceg-uc"
  

# Variables for Subnet

subnetipinfirstvpc = "10.1.0.0/26"
  
subnetnameinfirstvpc = "subnet-1-for-sceg-uc"
  
regionoffirstvpcsubnet = "us-central1"
  

#Variables values in firewall

firewallinfirstvpc = "firewall-to-allow-ssh-http"

targetvmtags = "net"
  
portstoallow = ["22","80","443"]
  
allowthesourceip = ["0.0.0.0/0"]

#Variables values for VPN 

cidrforsubnet1 = "10.3.0.0/26"
  
cidrforsubnet2 = "10.5.0.0/26"
  
cidrforsubnet3 = "10.7.0.0/26"
  
cidrforsubnet4 = "10.9.0.0/26"
  
asnforrouter1 = "65515"

asnforrouter2 = "65516"
  
tunnel00 = "tunnel1"
  
tunnel01 = "tunnel2"
  
tunnel11 = "tunnel3"
  
tunnel12 = "tunnel4"
  
vpcnetworkname1 = "network1"

vpcnetworkname2 = "network2"
  
subnet1nameinnet1 = "subnet-1-in-vpc-1"
  
subnet2nameinnet1 = "subnet-2-in-vpc-1"
  
subnet1nameinnet2 = "subnet-1-in-vpc-2"
  
subnet2nameinnet2 = "subnet-2-in-vpc-2"
  
subnet11region1 = "us-central1"
  
subnet21region2 = "us-east1"
  
subnet12region1 = "us-central1"
  
subnet22region2 = "us-central1"
  
bgpinterface11 = "us-east1"
  
bgpinterface12 = "bgpin12"
  
bgppeer11 = "bgppeer11"
  
bgppeer12 = "bgppeer12"
  
bgpinterface21 = "bgpin21"
  
bgpinterface22 = "bgpin22"
  
bgppeer21 = "bgppeer21"
  
bgppeer22 = "bgppeer22"
  
gatewaynameinvpc1 = "gateway-1"
  
gatewaynameinvpc2 = "gateway-2"

routername1 = "router-for-vpn-1"
  
routername2 = "router-for-vpn-2"
  
gateway1region = "us-central1"
  
gateway2region = "us-central1"

regionforbothrouters = "us-central1"
  
sharedsecretkey1 = "good"
  
sharedsecretkey2 = "test"

projectfornetwork1 = "arboreal-path-397504"
  
projectfornetwork2 = "arboreal-path-397504"

#Variable values for router

routername3 = "router-for-main-vpc"

routerregion3 = "asia-south1"

asnforrouter3 = "65519"

#Variable values for lb

cdnlbbackendname = "cdn-lb-backend"

managedzonename = "stepup-zone"

urlmapnameforproxy = "url-for-http-proxy"

objnameforhtml = "obj-name-to-store-html"

bucketlocationforwebsite = "US"

bucketname2forwebsite = "sceg-buck-for-website-465"

gforwardrulename = "gforwardingrule"

targethttpproxyname = "lb-for-website"