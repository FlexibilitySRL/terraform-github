# Github Member module

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Inputs

| Variable | Type | Description |
| --- | --- | --- |
| commons | set(string) | (Required) A list of commons members |
| admins | set(string) | (Optional) A list of admin members |

## Outputs

| Output | Description |
| --- | --- |
| membership | The full membership object |
