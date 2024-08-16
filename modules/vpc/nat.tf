
# Allocate an Elastic IP
resource "aws_eip" "nat_eip" {
  domain   = "vpc"
  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway 
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

   depends_on = [aws_internet_gateway.igw,
                aws_subnet.public_subnets]
}

# Private route table
resource "aws_route_table" "private_nat_gateway" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = local.open_cidr
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

# Route table association for private subnets
resource "aws_route_table_association" "nat_gateway" {
   count          = "${length(var.public_subnet_cidrs)}"
   subnet_id      = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id = aws_route_table.private_nat_gateway.id
}
