# Github Team module
Create a GitHub Team and assing their members

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
| name | The name of the team | string | | yes |
| description | A description of the team | string | `` | no |
| privacy | The level of privacy for the team. Must be one of secret or closed. | string | `closed` | no | 
| parent_team_id | The ID of the parent team, if this is a nested team. | number | `null`| no | 
| ldap_dn | The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise. | string | `null`| no |
| maintainers | A list of users that will be added to the current team with maintainer permissions. | set(string) | `[]` | no |
| members | A list of users that will be added to the current team with member permissions. | set(string) | `[]` | no | 

## Outputs

| Output | Description |
| --- | --- |
| id | The ID of the team. |
| team_name | The ID of the team. |
| slug | The Slug of the team. |
| team | The full team object. |
| team_memberships | A list of all team memberships. |



