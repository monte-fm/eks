/**
 * ACL's.
 * Creating ACL's to devide subnet port permissions.
 */
resource "aws_network_acl" "app_acl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [
    aws_subnet.app_subnet_a.id,
    aws_subnet.app_subnet_b.id,
    aws_subnet.app_subnet_c.id
  ]

  ingress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "10.10.0.0/16"
    from_port = 0
    to_port = 0
  }

  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
}

resource "aws_network_acl" "web_acl_public" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [
    aws_subnet.web_subnet_a.id,
    aws_subnet.web_subnet_b.id,
    aws_subnet.web_subnet_c.id
  ]

  ingress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  
  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
}