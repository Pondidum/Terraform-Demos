# Managing Consul's KV Store

Demo to accompany this blog post on [Managing AppSettings in Consul](https://andydote.co.uk/2018/08/07/managing-consul-appsettings/).

# To run this script:

You'll need an instance of [Consul](https://www.consul.io/) running locally to use this Terraform script, which you can do by [downloading the appropriate version](https://www.consul.io/downloads.html) for your OS, and running the following command:


First terminal:
```bash
consul agent -dev
```

Second terminal:
```bash
terraform init
terraform apply
```

You can verify the values are written correctly to the KeyValue store by checking the consul UI (http://localhost:8500).
Try creating another config file for a different environment and specifying the environment variable on the CLI:

```bash
terraform apply -var environment=prod
```
