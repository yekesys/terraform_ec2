
output "id" {
  description = "The policy ID"
  value       = aws_iam_role.lambda_function_role_tf.id

}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = aws_iam_role.lambda_function_role_tf.arn
}

