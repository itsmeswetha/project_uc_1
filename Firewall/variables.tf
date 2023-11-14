

variable "firewall_name" {
  type =string
  }

variable "source_ranges" {
  type = string
}

variable "networkname" {
  type = string
}
variable "tcpports" {
  type = list(string)
}

variable "targettag" {
}

variable "sourcetags" {
}
variable "project_id" {
  
}