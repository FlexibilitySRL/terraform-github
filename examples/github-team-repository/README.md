# Github Team-Repository module

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Inputs

| Variable | Type | Description |
| --- | --- | --- |
| team_id | string | (Required) The team id to asociate |
| pulls | set(string) | A list repositories for pull permission |
| admins | set(string) | (Optional) A list repositories for admin permission |
| maintainers | set(string) | (Optional) A list repositories for maintain permission |
| triages | set(string) | (Optional) A list repositories for triage permission |
| pushs | set(string) | (Optional) A list repositories for push permission |

## Outputs

| Output | Description |
| --- | --- |
| team_repository | The full team repository object |
