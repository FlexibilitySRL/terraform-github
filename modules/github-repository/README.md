# Github Repositories module

This module helps to create github repositories. And allows to create:

* [github_repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository)
* [github_branch](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch)
* [branch_protection](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection)

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Features

1. **Branch protection** Allow us to protect branchs
2. **Team restriction** Allow us to attach a github team

## Inputs description

| Input | Type | Description |
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

## Usage example
`main.tf`
```hcl
module "repositories" {
  for_each    = local.repositories
  source      = "./modules/github-repository"

  name                = each.value.name
  description         = can(each.value.description) ? each.value.description : ""

  visibility          = can(each.value.visibility) ? each.value.visibility : "private"
  auto_init           = can(each.value.auto_init) ? each.value.auto_init : false

  has_issues          = can(each.value.has_issues) ? each.value.has_issues : true
  has_downloads       = can(each.value.has_downloads) ? each.value.has_downloads : false
  has_projects        = can(each.value.has_projects) ? each.value.has_projects : false
  has_wiki            = can(each.value.has_wiki) ? each.value.has_wiki : false

  is_template         = can(each.value.is_template) ? each.value.is_template : false

  archived            = can(each.value.archived) ? each.value.archived : false

  branchs             = can(each.value.branchs) ? each.value.branchs : [] 
  protection_branchs  = can(each.value.protection_branchs) ? each.value.protection_branchs : { }

  template             = can(each.value.template) ? each.value.template : [] 
}
```

`locals.tf`:
```hcl
locals {
  restrictions_apps = ["simple_repository_name"]
  branchs = [ "develop", "master" ]
  
  repositories = {
        repository_name = {
        name          = "repository_name"
        description   = "Respository description"

        branchs = local.branchs
        protection_branchs  = {
          master = {
            required_approving_review_count = 1,
            restrictions_apps = local.restrictions_apps,
            restrictions_teams = [
                              data.terraform_remote_state.github_teams.outputs.teams["team-name"].slug
                              ]
          }
        }
      },
      simple_repository_name = {
          name          = "simple_repository_name"
          description   = "Repository description"

          branchs       = [ "master" ]
      }
  }
}
```

## Authors

Module managed by [Flexibility](https://www.flexibility.com.ar/).

## License

Apache 2 Licensed. See LICENSE for full details.
