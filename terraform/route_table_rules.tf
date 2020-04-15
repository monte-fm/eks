#############################
### NAT gatway route rule ###
#############################
resource "aws_route" "ngw_a" {
  route_table_id            = aws_route_table.private_route_table_a.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw_a.id
  depends_on                = [aws_route_table.private_route_table_a]
}

resource "aws_route" "ngw_b" {
  route_table_id            = aws_route_table.private_route_table_b.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw_a.id
  depends_on                = [aws_route_table.private_route_table_b]
}

resource "aws_route" "ngw_c" {
  route_table_id            = aws_route_table.private_route_table_c.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw_a.id
  depends_on                = [aws_route_table.private_route_table_c]
}

#############################################
### Internet gatway rule for public route ###
#############################################
resource "aws_route" "igw_public" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.main.id
  depends_on                = [aws_route_table.public_route_table]
}