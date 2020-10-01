# Github Repository module

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Inputs

| Variable | Type | Description |
| --- | --- | --- |
| name | string | (Required) The name of the repository |
| description | string | (Optional) A description of the repository |
| homepage_url | string | (Optional) A homepage url of the repository |
| visibility | string | (Optional) Define if the repository is private or not. Default is private |
| has_issues | bool | (Optional) Define if the repository has issue tab or not. Default is true |
| has_projects | bool | (Optional) Define if the repository has project tab or not. Default is false |
| has_wiki | bool | (Optional) Define if the repository has wiki tab or not. Default is false |
| is_template | bool | (Optional) Define if the repository is a template or not. Default is false |
| allow_merge_commit | bool | (Optional) Define if the repository allow merge method. Default is true |
| allow_squash_merge | bool | (Optional) Define if the repository allow squash method. Default is true |
| allow_rebase_merge | bool | (Optional) Define if the repository allow rebase method. Default is true |
| delete_branch_on_merge | bool | (Optional) Define if the repository delete the branch after merge. Default is false |
| has_downloads | bool | (Optional) Define if the repository has download tabs or not. Default is true |
| auto_init | bool | (Optional) Define if the repository autoinitialize or not. Default is false |
| gitignore_template | string | (Optional) The gitignore template for the repository |
| license_template | string | (Optional) The license template for the repository |
| archived | bool | (Optional) Define if the repository has to be archived or not. Default is false |
| branchs | set(string) | (Optional) A list branch to create |
| protection_branchs | any | (Optional) A branch protection config for the repository |
| template | list(string) | (Optional) Template Data |

## Outputs

| Output | Description |
| --- | --- |
| repository | The full repository object |
