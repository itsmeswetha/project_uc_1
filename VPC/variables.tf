variable "vpc_name" {
  type =  string
  description = "My first network"
}

variable "projectid" {
  type = string
  description = "The project this network belongs"
}
variable "defaultprojectregion" {
  type = string
  description = "The default region for the project"
}