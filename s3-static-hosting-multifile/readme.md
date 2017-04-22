# S3 Multi-file upload

* Update the name of the bucket in the `main.tf` file
* Run the `files.sh` script to generate a `resource "aws_s3_bucket_object"` for each file in the `./src` directory
* Run `terraform apply`
* Visit your shiny s3 hosted website
