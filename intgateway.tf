resource "aws_internet_gateway" "CSIGW" {
  vpc_id = aws_vpc.prakash-vpc.id
  tags = {
    Name = "Prakash IGW"
  }

}