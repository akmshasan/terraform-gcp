## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instances"></a> [instances](#input\_instances) | Map of VM instances to create | <pre>map(object({<br/>    name                        = string<br/>    zone                        = string<br/>    machine_type                = string<br/>    tags                        = optional(list(string), [])<br/>    metadata                    = optional(map(string), {})<br/>    network                     = string<br/>    subnetwork                  = string<br/>    internal_ip                 = string<br/>    service_account             = string<br/>    scopes                      = list(string)<br/>    labels                      = optional(map(string), {})<br/>    enable_secure_boot          = optional(bool, true)<br/>    enable_vtpm                 = optional(bool, true)<br/>    enable_integrity_monitoring = optional(bool, true)<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_names"></a> [instance\_names](#output\_instance\_names) | Map of VM instance names |
| <a name="output_instance_self_links"></a> [instance\_self\_links](#output\_instance\_self\_links) | Map of VM instance self-links |
| <a name="output_internal_ips"></a> [internal\_ips](#output\_internal\_ips) | Map of VM internal IP addresses |
