resource "aws_security_group" "eks_security_group" {
  description = "Default security group for all worker instances in VPC"
  vpc_id = aws_vpc.main.id
  name = "eks_security_group"

  ingress {
    from_port = var.ssh_server_port
    to_port = var.ssh_server_port
    protocol = "tcp"
    cidr_blocks = [
      "10.10.0.0/16"]
  }

  ingress {
    from_port = var.http_server_port
    to_port = var.http_server_port
    protocol = "tcp"
    cidr_blocks = [
      "10.10.0.0/16"]
  }

  ingress {
    from_port = var.https_server_port
    to_port = var.https_server_port
    protocol = "tcp"
    cidr_blocks = [
      "10.10.0.0/16"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "10.10.0.0/16"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "App security group"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_security_group" "alb_sg" {
  description = "Public ALB"
  vpc_id = aws_vpc.main.id
  name = "public_alb"

  ingress {
    from_port = var.http_server_port
    to_port = var.http_server_port
    protocol = "tcp"
    cidr_blocks = [
      "10.10.0.0/16",
      "176.105.43.145/32"
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}