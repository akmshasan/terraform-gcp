## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.29 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.29 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.45.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudnat"></a> [cloudnat](#module\_cloudnat) | ../../modules/cloudnat | n/a |
| <a name="module_cloudrouter"></a> [cloudrouter](#module\_cloudrouter) | ../../modules/cloudrouter | n/a |
| <a name="module_nat_ip_vpc_a_1"></a> [nat\_ip\_vpc\_a\_1](#module\_nat\_ip\_vpc\_a\_1) | ../../modules/public_ip | n/a |
| <a name="module_nat_ip_vpc_a_2"></a> [nat\_ip\_vpc\_a\_2](#module\_nat\_ip\_vpc\_a\_2) | ../../modules/public_ip | n/a |
| <a name="module_nat_ip_vpc_b"></a> [nat\_ip\_vpc\_b](#module\_nat\_ip\_vpc\_b) | ../../modules/public_ip | n/a |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | ../../modules/service_account | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ../../modules/subnets | n/a |
| <a name="module_vm_instances"></a> [vm\_instances](#module\_vm\_instances) | ../../modules/vm_instance | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.dev_app_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | `"learning-0165559734"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region of the Project | `string` | `"asia-southeast1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudnat_attached_ips"></a> [cloudnat\_attached\_ips](#output\_cloudnat\_attached\_ips) | n/a |
| <a name="output_nat_names"></a> [nat\_names](#output\_nat\_names) | Names of created Cloud NATs |
| <a name="output_router_names"></a> [router\_names](#output\_router\_names) | Names of created Cloud Routers |
| <a name="output_router_self_links"></a> [router\_self\_links](#output\_router\_self\_links) | Self-links of Cloud Routers |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Self-links of created subnets |
| <a name="output_vpc_networks"></a> [vpc\_networks](#output\_vpc\_networks) | List of created VPC networks |
