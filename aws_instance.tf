data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [ aws_security_group.allow_http.id ]
  associate_public_ip_address = true
    tags = {
    Name = "HelloWorld"
  }
  user_data = <<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/gabrielecirulli/2048.git
sudo cp -R 2048/* /var/www/html
sudo systemctl restart nginx
EOF
}