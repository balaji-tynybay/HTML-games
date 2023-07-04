resource "aws_subnet" "subnet" {
  count = length(var.cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "main-subnet-${count.index}"
  }
}
