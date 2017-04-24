data "archive_file" "sub_lambda" {
  type = "zip"
  source_file = "./js/subindex.js"
  output_path = "sub-lambda.zip"
}

resource "aws_lambda_function" "sub_lambda" {
  filename = "${data.archive_file.sub_lambda.output_path}"
  function_name = "sub_lambda"
  role = "${aws_iam_role.example_api_role.arn}"
  handler = "subindex.handler"
  runtime = "nodejs4.3"
  timeout = 20
  source_code_hash = "${base64sha256(file("${data.archive_file.sub_lambda.output_path}"))}"
  publish = true
}
