
# Github Repository module
Create a GitHub Repository and their branches and branch protection.

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
| name | The name of the repository | string | | yes |
| description | A description of the repository | string | `` | no |
| homepage_url | A homepage url of the repository | string | `` | no | 
| visibility | Define if the repository is private or not. | string | `private`| no | 
| has_issues | Define if the repository has issue tab or not. | bool | `true`| no |
| has_projects | Define if the repository has project tab or not. | bool | `false` | no |
| has_wiki | Define if the repository has wiki tab or not. | bool | `false` | no | 
| is_template | Define if the repository is a template or not. | bool | `false` | no | 
| allow_merge_commit | Define if the repository allow merge method. | bool | `true` | no |
| allow_squash_merge | Define if the repository allow squash method. | bool | `true` | no | 
| allow_rebase_merge | Define if the repository allow rebase method. | bool | `true` | no | 
| delete_branch_on_merge | Define if the repository delete the branch. | bool | `false` | no | 
| has_downloads | bool | Define if the repository has download tabs or not. | `true` | no | 
| auto_init | Define if the repository autoinitialize or not. | bool | `false` | no | 
| gitignore_template | The gitignore template for the repository | string | `null` | no | 
| license_template | The license template for the repository | string | `null` | no |
| archived | Define if the repository has to be archived or not. | bool | `false` | no |
| branchs | A list branch to create | set(string) | `[]` | no | 
| protection_branchs | A branch protection config for the repository | any | `[]` | no |
| template | Template Data | list(map(string)) | `[]` | no | 

## Outputs

| Output | Description |
| --- | --- |
| repository | The full repository object |
