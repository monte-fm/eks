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
 * NAT Gateway
 */
resource "aws_eip" "nat_gw_a" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.nat_gw_a.id
  subnet_id     = aws_subnet.app_subnet_a.id
}

resource "aws_eip" "nat_gw_b" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.nat_gw_b.id
  subnet_id     = aws_subnet.app_subnet_b.id
}

resource "aws_eip" "nat_gw_c" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_c" {
  allocation_id = aws_eip.nat_gw_c.id
  subnet_id     = aws_subnet.app_subnet_c.id
}

/**
 * App Subnet.
 */
resource "aws_subnet" "app_subnet_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_app_a
  map_public_ip_on_launch = false
  availability_zone = "${var.region}a"

  lifecycle {
    ignore_changes = [
      tags["kubernetes.io/cluster/eks_cluster"]
    ]
  }

  tags = {
    Name = "Workers subnet A"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_app_subnet_a" {
  subnet_id = aws_subnet.app_subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_subnet" "app_subnet_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_app_b
  map_public_ip_on_launch = false
  availability_zone = "${var.region}b"

  tags = {
    Name = "Workers subnet B"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_app_subnet_b" {
  subnet_id = aws_subnet.app_subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_subnet" "app_subnet_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cluster_subnet_cidr_app_c
  map_public_ip_on_launch = false
  availability_zone = "${var.region}c"

  tags = {
    Name = "Workers subnet C"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_route_table_association" "route_of_app_subnet_c" {
  subnet_id = aws_subnet.app_subnet_c.id
  route_table_id = aws_route_table.private_route_table_c.id
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

/**
 * Route tables.
 * Creating private and public route tables.
 */
resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}