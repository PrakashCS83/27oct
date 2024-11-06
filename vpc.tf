resource "aws_vpc" "prakash-vpc" {
  cidr_block           = var.vpc-id
  enable_dns_hostnames = true
  tags = {

    Name = "Terraform-Prakash-VPC"


  }
}

resource "aws_subnet" "public-subnets" {
  cidr_block              = each.value.cidr_block
  for_each                = var.pub-subnets
  vpc_id                  = aws_vpc.prakash-vpc.id
  map_public_ip_on_launch = true
  availability_zone       = each.value.availablity_zone
  tags = {
    Name = each.value.sub-name
  }

}

resource "aws_subnet" "private-subnets" {
  cidr_block        = each.value.cidr_block
  for_each          = var.pri-subnets
  vpc_id            = aws_vpc.prakash-vpc.id
  availability_zone = each.value.availablity_zone
  tags = {
    Name = each.value.sub-name
  }

}



//resource "aws_route_table" "PublicRT" {
 // vpc_id = aws_vpc.prakash-vpc.id
  //route {
    //cidr_block = "0.0.0.0/0"
    //gateway_id = aws_internet_gateway.CSIGW.id
  //}
  //tags = {
    //Name = "Public Route Table"
  //}
//}
