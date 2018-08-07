variable "environment" {
  default = "test"
}

resource "consul_key_prefix" "myapp_config" {
  path_prefix = "appsettings/testapp/"

  subkeys = "${data.external.config_file.result}"
}

data "external" "config_file" {
  program = ["bash", "mergeconfigs.sh", "config.json", "config.${var.environment}.json"]
}
