resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "route_association" {
  count          = length(var.cidr)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.main.id

}
