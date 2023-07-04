resource "aws_instance" "web" {
  count = 2

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance
  subnet_id = aws_subnet.subnet[count.index].id
  vpc_security_group_ids = [ aws_security_group.allow_http.id ]
  associate_public_ip_address = true
    tags = {
    Name = "web - ${count.index}"
  }
  user_data = <<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/nebez/floppybird.git
sudo cp -R floppybird/* /var/www/html
sudo systemctl restart nginx
EOF
}