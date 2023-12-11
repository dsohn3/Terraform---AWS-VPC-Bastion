resource "aws_route_table" "secondary-rt" {
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Second Route Table - Demo VPC"
  }
}

resource "aws_route_table_association" "public-subnets" {
  count          = length(var.public-subnet-cidrs)
  subnet_id      = element(aws_subnet.public-subnets[*].id, count.index)
  route_table_id = aws_route_table.secondary-rt.id
}