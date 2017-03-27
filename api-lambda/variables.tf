variable "region" {
  default = "eu-west-1"
}

variable "account_id" {
  default = " YOUR ACCOUNT ID HERE " //a number, you can find it in the aws console.
}

provider "aws" {
    profile = "default"
    region = "${var.region}"
}
