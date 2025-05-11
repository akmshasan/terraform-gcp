## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.29 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.29 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_routers"></a> [routers](#input\_routers) | Map of Cloud Routers to create | <pre>map(object({<br/>    name    = string<br/>    region  = string<br/>    network = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_router_names"></a> [router\_names](#output\_router\_names) | Map of Cloud Router names |
| <a name="output_router_self_links"></a> [router\_self\_links](#output\_router\_self\_links) | Map of Cloud Router self\_links |
