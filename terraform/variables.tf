#Terraform infrastructure variables
variable "region" {
  default = "eu-west-1"
}

variable "eks_public_access_cidrs" {
  description = "Your private IP address"
}

variable "cluster_subnet_cidr_web_a" {
  default = "10.10.10.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_web_b" {
  default = "10.10.20.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_web_c" {
  default = "10.10.30.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}
