/**
 * Route tables.
 * Creating public route tables.
 */
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
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