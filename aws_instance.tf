resource "aws_instance" "web" {
  count = 2

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance
  subnet_id = aws_subnet.subnet[count.index].id
  vpc_security_group_ids = [ aws_security_group.allow_http.id ]
  associate_public_ip_address = true
  user_data = file("userdata.sh")
  tags = {
    Name = "web - ${count.index}"
  }
  
}