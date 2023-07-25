output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_cidr" {
    value = var.cidr
}

output "subnet_id" {
    value = aws_subnet.subnet[*].id 
}