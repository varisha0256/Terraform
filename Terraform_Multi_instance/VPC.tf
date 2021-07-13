resource "aws_vpc" "TF_VPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "testGW" {
  vpc_id = aws_vpc.TF_VPC.id
  tags = {
    Name = var.IGW_name
  }
}

resource "aws_subnet" "subnets" {
  count                   = 3
  vpc_id                  = aws_vpc.TF_VPC.id
  map_public_ip_on_launch = true
  cidr_block              = element(var.blocks, count.index)
  availability_zone       = element(var.azs, count.index)
  tags = {
    Name = "TF_subnet_${count.index + 1}"
  }
}

resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.TF_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testGW.id
  }
  tags = {
    Name = var.Main_Routing_Table
  }
}

resource "aws_route_table_association" "TF_route" {
  count          = length(var.blocks)
  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = aws_route_table.route-public.id
}
