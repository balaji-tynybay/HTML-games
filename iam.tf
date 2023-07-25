resource "aws_iam_role" "test_role" {
  name = "ssm_role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})

  tags = {
    name = "role"
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "ssm_profile"
  role = aws_iam_role.test_role.name
}