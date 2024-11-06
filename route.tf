resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.prakash-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.CSIGW.id
      }
  tags = {
    Name = "PublicRT"
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.prakash-vpc.id
  tags = {
    Name = "PrivateRT"
  }
  
}


resource "aws_route_table_association" "myPubRTS" {
  for_each       = aws_subnet.public-subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.PublicRT.id 
}

resource "aws_route_table_association" "myPriRTS" {
  for_each       = aws_subnet.private-subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.PrivateRT.id

}
