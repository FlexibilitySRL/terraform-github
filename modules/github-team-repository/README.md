# Github Team-Repository module
Add teams to repositories with different access. 

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
| team_id | The team id to asociate | string | | yes | 
| pulls | A list repositories for pull permission | set(string) | | no |
| admins | A list repositories for admin permission | set(string) | `[]` | yes |
| maintainers | A list repositories for maintain permission | set(string) | `[]` | yes | 
| triages | A list repositories for triage permission | set(string) | `[]` | yes |
| pushs | A list repositories for push permission | set(string) | `[]` | yes |

## Outputs

| Output | Description |
| --- | --- |
| team_repository | The full team repository object |
