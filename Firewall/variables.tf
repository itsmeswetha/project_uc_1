

variable "firewall_name" {
  type =string
  }

variable "sourceranges" {
  
}

variable "vpcname1" {
  type = string
}
variable "tcpports" {
  type = list(string)
}

variable "targettag" {
}

/*variable "sourcetags" {
}*/
/*variable "projectid" {
  
}*/