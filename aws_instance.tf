# resource "aws_instance" "web" {
#   count = 2

#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance
#   subnet_id = aws_subnet.subnet[count.index].id
#   vpc_security_group_ids = [ aws_security_group.allow_http.id ]
#   associate_public_ip_address = true
#   user_data = file("userdata.sh")
#   tags = {
#     Name = "web - ${count.index}"
#   }

# }

# resource "aws_launch_configuration" "as_conf" {
#   name          = "web_config"
#   image_id      = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#   security_groups = aws_security_group.allow_http.index
#   user_data = file("userdata.sh")

# }

resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance
  iam_instance_profile {
    name = "ssm_profile"
  }
  user_data     = filebase64("userdata.sh")
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_http.id]
  }

}

resource "aws_autoscaling_group" "bar" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.test.arn]
  vpc_zone_identifier = [aws_subnet.subnet[0].id, aws_subnet.subnet[1].id]
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = aws_lb_target_group.test.arn
}
