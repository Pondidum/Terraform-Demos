variable "region" {
  default = "eu-west-1"
}

provider "aws" {
    profile = "default"
    region = "${var.region}"
}
