
# Public subnet
resource "aws_subnet" "public_subnets" {
 count             = length(local.public_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(local.public_subnet_cidrs, count.index)
 availability_zone = element(local.azs, count.index)
 tags = {
   name = "public-subnet-${element(local.azs, count.index)}-${count.index + 1}"
   env = "${var.environment}"
 }
}
 
# Private subnet 
resource "aws_subnet" "private_subnets" {
 count             = length(local.private_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(local.private_subnet_cidrs, count.index)
 availability_zone = element(local.azs, count.index)
 
 tags = {
   Name = "private-subnet-${element(local.azs, count.index)}-${count.index + 1}"
   env = "${var.environment}"
 }

}
