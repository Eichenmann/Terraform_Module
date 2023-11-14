resource "aws_iam_role" "role" {
  name = var.role_name
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "role_policy" {
  name = "${var.role_name}-policy"
  role = aws_iam_role.role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.policy_actions
        Effect   = var.policy_effect
        Resource = var.policy_resources
      },
    ]
  })
}

resource "aws_iam_instance_profile" "profile" {
  name = "${var.role_name}-profile"
  role = aws_iam_role.role.name
}
module "ec2" {
  source = "./modules/ec2"

  instance_profile = module.role.instance_role_name
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "my-s3-bucket-uo1331iou111"
  bucket_encryption_enabled = true
}

module "role" {
  source = "./modules/iam"

  role_name = "MyEC2InstanceRole"
  policy_actions = [ "s3:*" ]
  policy_effect = "Allow"
  policy_resources = [module.s3.bucket_arn, "${module.s3.bucket_arn}/*"]
}