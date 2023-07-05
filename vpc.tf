resource "aws_vpc" "main" {
  cidr_block = var.vpc
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet gateway"
  }
}