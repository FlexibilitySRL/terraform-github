# Github Team module

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Inputs

| Variable | Type | Description |
| --- | --- | --- |
| name | string | (Required) The name of the team |
| description | string | (Optional) A description of the team |
| privacy | string | (Optional) The level of privacy for the team. Must be one of secret or closed |
| parent_team_id | number | (Optional) The ID of the parent team, if this is a nested team |
| ldap_dn | string | (Optional) The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise |
| maintainers | set(string) | ((Optional) A list of users that will be added to the current team with maintainer permissions |
| members | set(string) | (Optional) A list of users that will be added to the current team with member permissions |
| module_depends_on | any | (Optional) A list of external resources the module depends_on. Default is [] |

## Outputs

| Output | Description |
| --- | --- |
| id | The ID of the team |
| team_name | The name of the team |
| slug | The Slug of the team |
| team | The full team object |
| team_membership | A list of all team memberships |
