<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-drk-slogan.png">
  <source media="(prefers-color-scheme: light)" srcset="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-lgt-slogan.png">
  <img alt="OPSdiy - the effortless way of managing cloud infrastructure." src="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-lgt-slogan.png" width="700">
</picture>

# terraform-module-digitalocean-kafka

## Introduction

Terraform module to provision DigitalOcean DigitalOcean Managed Kafka.

## Usage

```hcl
module "example" {
  source = "github.com/opsd-io/terraform-module-digitalocean-kafka"

  cluster_name     = "example"
  region           = "nyc1"
  topics           = ["topic1", "topic2"]
}

```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.34.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.34.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_database_cluster.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_cluster) | resource |
| [digitalocean_database_firewall.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_firewall) | resource |
| [digitalocean_database_kafka_topic.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_kafka_topic) | resource |
| [digitalocean_database_user.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | List of trusted IP addresses associated with the cluster. | `set(string)` | `[]` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the database cluster. | `string` | n/a | yes |
| <a name="input_database_users"></a> [database\_users](#input\_database\_users) | A list of the cluster users. | `map(map(string))` | `{}` | no |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | Database Droplet size associated with the cluster. | `string` | `"db-s-2vcpu-2gb"` | no |
| <a name="input_kafka_version"></a> [kafka\_version](#input\_kafka\_version) | Engine version used by the cluster. | `string` | `"3.7"` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of the week on which to apply maintenance updates. | `string` | `"tuesday"` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | he hour in UTC at which maintenance updates will be applied in 24 hour format. | `string` | `"23:00"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes that will be included in the cluster. At least 3. | `number` | `3` | no |
| <a name="input_private_network_uuid"></a> [private\_network\_uuid](#input\_private\_network\_uuid) | The ID of the VPC where the database cluster will be located. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project that the database cluster is assigned to. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | DigitalOcean region where the cluster will reside. | `string` | n/a | yes |
| <a name="input_storage_size_mib"></a> [storage\_size\_mib](#input\_storage\_size\_mib) | Defines the disk size, in MiB, allocated to the cluster. | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag names to be applied to the database cluster. | `set(string)` | `[]` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | A set of Kafka topics to create. | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database"></a> [database](#output\_database) | Name of the cluster's default database. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | A unique identifier for the cluster's firewall. |
| <a name="output_host"></a> [host](#output\_host) | Database cluster's hostname. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the database cluster. |
| <a name="output_port"></a> [port](#output\_port) | Network port that the database cluster is listening on. |
| <a name="output_private_host"></a> [private\_host](#output\_private\_host) | Same as host, but only accessible from resources within the account and in the same region. |
| <a name="output_private_uri"></a> [private\_uri](#output\_private\_uri) | Same as uri, but only accessible from resources within the account and in the same region. |
| <a name="output_uri"></a> [uri](#output\_uri) | The full URI for connecting to the database cluster. |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name of the database cluster. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
