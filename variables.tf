variable "aws_region" {
    type = "string"
    description = "Region of the VPC"
}
variable "aws_azs" {
  type = "list"
  description = "Available zones"
}
variable "vpc_cidr" {
    type = "string"
    description = "CIDR block"
}
variable "vpc_name" {
    type = "string"
    description = "Name of the VPC"
}


}
variable "app_name" {
    type = "string"
    description = "Name of the application"
}

