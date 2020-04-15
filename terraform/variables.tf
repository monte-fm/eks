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

variable "cluster_subnet_cidr_app_a" {
  default = "10.10.110.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_app_b" {
  default = "10.10.120.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_app_c" {
  default = "10.10.130.0/24"
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "ssh_server_port" {
  default = 22
}

variable "http_server_port" {
  default = 80
}

variable "https_server_port" {
  default = 443
}
