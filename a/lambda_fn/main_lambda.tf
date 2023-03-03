
resource "aws_lambda_function" "write_to_s3_lfn" {
  filename      = "lambda_function_payload.zip"
  function_name = "write_to_s3_lfn"
  role          = aws_iam_role.lambda_function_role_tf.arn
  handler       = "lambda_function.lambda_handler"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime = "python3.8"
}
# runtime: 3.8



