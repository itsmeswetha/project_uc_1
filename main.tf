# Creating modules to build all the instances at the same time


/*********************************
         VPC Configuration
**********************************/         

module "VPC"{
    source = "/home/swethaManasa/Documents/Project_us_1/VPC"
    name = var.vpcname
    project = var.projectid
}

/*********************************
     Subnet Configuration            
**********************************/

module "subnet"{
    source = "/home/swethaManasa/Documents/Project_us_1/Subnet"
    name = var.subnetname
    network = module.VPC.name
    region = var.subnetregion
    ip_cidr_range = var.iprange
}

/*********************************
      Firewall Configuration
**********************************/
module "firewallrule"{
    source = "/home/swethaManasa/Documents/Project_us_1/Firewall"
    name = var.firewall_name
    network = module.VPC.name
    target_tags = var.target
    source_tags = var.source
}      

