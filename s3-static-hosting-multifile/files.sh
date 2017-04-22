#! /bin/sh

SRC="src/"
TF_FILE="files.tf"

cat > $TF_FILE << EOM
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
EOM


COUNT=0
find $SRC -iname '*.*' | while read path; do

    cat >> $TF_FILE << EOM

resource "aws_s3_bucket_object" "file_$COUNT" {
  bucket = "\${aws_s3_bucket.static_site.bucket}"
  key = "${path#$SRC}"
  source = "$path"
  content_type = "\${lookup(var.mime_types, "${path##*.}")}"
  etag = "\${md5(file("$path"))}"
}
EOM

    COUNT=$(expr $COUNT + 1)

done
