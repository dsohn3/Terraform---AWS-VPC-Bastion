resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Demo VPC"
  }
}

resource "aws_subnet" "public-subnets" {
  count             = length(var.public-subnet-cidrs)
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = element(var.public-subnet-cidrs, count.index)
  availability_zone = element(var.availability-zones, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(var.private-subnet-cidrs)
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = element(var.private-subnet-cidrs, count.index)
  availability_zone = element(var.availability-zones, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}