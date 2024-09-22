
resource "aws_iam_role" "lambda_function_role_tf" {
  name_prefix = "lambda_function_role_tf"
  #name = "lambda_function_role_tf"
  force_detach_policies = true

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
            "Service": "lambda.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "my_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
            Sid: "",
            Effect: "Allow",
            Action: [
                "logs:PutLogEvents",
                "logs:CreateLogStream",
                "logs:CreateLogGroup"
            ],
            Resource: "arn:aws:logs:us-east-1:169960080437:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::chris41-yeke-temp-git-terraform-not-tf"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutObjectTagging",
                "s3:GetObjectTagging",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3::: chris41-yeke-temp-git-terraform-not-tf/*"
            ]
        }
      ]
    })
  }





#  tags = {
#    tag-key = "lambda_function_role_tf"
#  }
}


#resource "aws_iam_role" "lambda_role_tf" {
#
#
#module "iam_policy" {
#  source = "../../modules/iam-policy"
#
#  name        = "example"
#  path        = "/"
#  description = "My example policy"
#
#  policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": [
#        "ec2:Describe*"
#      ],
#      "Effect": "Allow",
#      "Resource": "*"
#    }
#  ]
#}
#EOF
#
#  tags = {
#    PolicyDescription = "Policy created using heredoc policy"
#  }
#}
#
#



#resource "aws_iam_role_policy_attachment" "lambda_policy" {
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
#  role       = aws_iam_role.lambda_role_tf.name
#}



# Note that the following permissions are needed for the user that terraform runs as:
#    "Statement": [
#        {
#            "Effect": "Allow",
#            "Action": [
#                "iam:ListInstanceProfilesForRole",
#                "iam:DeleteRolePolicy",
#                "iam:CreateRole",
#                "iam:DeleteRole",
#                "iam:PutRolePolicy",
#                "iam:ListInstanceProfiles"
#            ],
#            "Resource": "arn:aws:iam::accountnumber:role/*"
#        }
#    ]

