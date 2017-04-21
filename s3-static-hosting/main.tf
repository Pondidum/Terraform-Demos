variable "bucket" {
  default = "examplebucket"
}

data "template_file" "s3_public_policy" {
  template = "${file("policies/s3-public.json")}"
  vars {
    bucket_name = "${var.bucket}"
  }
}

resource "aws_s3_bucket" "static_site" {
  bucket = "${var.bucket}"
  acl = "public-read"
  policy = "${data.template_file.s3_public_policy.rendered}"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = "${aws_s3_bucket.static_site.bucket}"
  key = "index.html"
  source = "src/index.html"
  content_type = "text/html"
  etag = "${md5(file("src/index.html"))}"
}

output "url" {
  value = "${aws_s3_bucket.static_site.bucket}.s3-website-${var.region}.amazonaws.com"
}
