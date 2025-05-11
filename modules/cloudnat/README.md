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
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nats"></a> [nats](#input\_nats) | Map of NAT configurations | <pre>map(object({<br/>    name    = string<br/>    region  = string<br/>    router  = string<br/>    nat_ips = optional(list(string))<br/>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attached_nat_ips"></a> [attached\_nat\_ips](#output\_attached\_nat\_ips) | Map of NATs to their attached static IPs |
| <a name="output_nat_names"></a> [nat\_names](#output\_nat\_names) | Map of NAT names |
