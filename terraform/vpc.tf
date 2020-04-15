resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = true
}

/**
 * Internet Gateway
 */
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

/**
 * Public Subnets.
 */
resource "aws_subnet" "web_subnet_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_web_a
  map_public_ip_on_launch = false
  availability_zone = "${var.region}a"

  tags = {
    Name = "Public subnet A"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_web_subnet_a" {
  subnet_id = aws_subnet.web_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "web_subnet_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_web_b
  map_public_ip_on_launch = false
  availability_zone = "${var.region}b"

  tags = {
    Name = "Public subnet B"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_web_subnet_b" {
  subnet_id = aws_subnet.web_subnet_b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "web_subnet_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_web_c
  map_public_ip_on_launch = false
  availability_zone = "${var.region}c"

  tags = {
    Name = "Public subnet C"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_web_subnet_c" {
  subnet_id = aws_subnet.web_subnet_c.id
  route_table_id = aws_route_table.public_route_table.id
}