# Github Member module
Assign a Member to a GitHub Account/Organization.

## Requirements
| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |
                                                                                                                                                                                                                   
## Providers
| Name | Version |
|------|---------|
| [Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs)  | ~> 3.0.0 

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| commons | A list of commons members | set(string) |  | yes |
| admins | A list of admin members | set(string) | `[]` | no |

## Outputs

| Output | Description |
| --- | --- |
| membership | The full membership object |
