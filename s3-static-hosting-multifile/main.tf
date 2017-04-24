variable "mime_types" {
  default = {
    htm = "text/html"
    html = "text/html"
    css = "text/css"
    js = "application/javascript"
    map = "application/javascript"
    json = "application/json"
  }
}

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

output "url" {
  value = "${aws_s3_bucket.static_site.bucket}.s3-website-${var.region}.amazonaws.com"
}
