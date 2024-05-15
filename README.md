<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-drk-slogan.png">
  <source media="(prefers-color-scheme: light)" srcset="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-lgt-slogan.png">
  <img alt="OPSdiy - the effortless way of managing cloud infrastructure." src="https://www-opsd-io.s3.eu-central-1.amazonaws.com/OPSdiy/OPSdiy-Medium-lgt-slogan.png" width="700">
</picture>

# terraform-module-template

## Introduction

What does the module provide?

## Usage

```hcl
module "module_name" {
  source = "github.com/opsd-io/terraform-module-template?ref=VERSION"

  name = "module-template"
  size = 9000
}

```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_data.main](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | A name for the test resource. | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The ID of the parent resource. Change will trigger a recreation. | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | A size for the test resource in MiB. | `number` | `256` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_byte_size"></a> [byte\_size](#output\_byte\_size) | The size of the resource, in bytes. |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | The full name of the resource. |
| <a name="output_id"></a> [id](#output\_id) | A string value unique to the resource instance. |
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
