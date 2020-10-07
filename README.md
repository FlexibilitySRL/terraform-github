

#  Terraform Module: Github

A Terraform module for admin GitHub Account/Organization

These types of resources are supported:
* [github_membership](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/membership)
* [github_team](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team)
* [github_team_membership](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_membership)
* [github_repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository)
* [github_branch](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch)
* [branch_protection](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection)
* [github_team_repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_repository)

## Requirements                                                                                                                                                                                                    
                                                                                                                                                                                                                   
| Name | Version |                                                                                                                                                                                                 
|------|---------|                                                                                                                                                                                                 
| terraform | >= 0.13.0 |                                                                                                                                                                                         
| aws | ~> 3.0 |                                                                                                                                                                                                   
                                                                                                                                                                                                                   
## Providers                                                                                                                                                                                                       
                                                                                                                                                                                                                   
| Name | Version |                                                                                                                                                                                                 
|------|---------|                                                                                                                                                                                                 
| [Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs)  | ~> 3.0.0 |


## Features

### Members Management
 - Add member to the GitHub Account/Organization
 - Asign member to Team

### Repositories Management
- Create Repositorie
- Define default branchs
- Define branch protection and restrictions.

### Teams Management
- Create teams
- Add teams to repositories

## Usage

`github-membership`:
```hcl
module "members" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-member"

  admins      = [ "maintainer", "admin-company" ]
  commons     = [ "developer", "customer", "tester", "ops" ]
}
```

`github-team`:
```hcl
module "parent_teams" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-team"
  name        = "Implementation"
  description = "This is the description of the team" 
  members     = [ "customer" ]
  maintainers = [ "maintainer" ]
}

module "child_teams" {
  source          = "github.com/FlexibilitySRL/terraform-github/modules/github-team"

  name            = "Developer team"
  parent_team_id  = module.parent_teams["Implementation"].id
  members         = [ "developer", "tester" ]
  maintainers     = [ "maintainer" ]

  depends_on = [
    module.parent_teams
  ]
}
```

`github-repository`:
```hcl
module "repositories" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-repository"

  name                = "Repository name"
  description         = "Repository description"
  visibility          = "public"

  branchs             = [ "master" , "develop" ] 
  protection_branchs  = {
      master = {
          required_approving_review_count = 2,
          restrictions_teams = [ "ops", "maintainer" ]
        },
      release = {
          required_approving_review_count = 1,
          restrictions_teams = [ "ops" ]
        }
   }
}
```

`github-team-repository`:
```hcl
module "team_repository" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-team-repository"

  team_id     = module.parent_teams["implementation"].id
  admins      = [ "maintainer" ]
  pushs       = [ "developer" ]
  pulls       = [ "tester" ]
  maintainers = [ "maintainer" ]
}
```

**NOTE**: In order to use the GitHub module it's necessary to config the Terraform GitHub Provider:

    #=============================#
    # GITHUB Provider Settings    #
    #=============================#
    provider "github" {
      token        = [GITHUB_ACCESS_TOKEN]
      organization = [GITHUB_ORGANIZATION]
      version = "~> 3.0.0"
    }

### 1. Add Github Members

Use [github-membership module](https://github.com/FlexibilitySRL/terraform-github/modules/github-membership) module to add github members to company.

### 2. Create Teams and add Members

Use [github-team module](https://github.com/FlexibilitySRL/terraform-github/modules/github-team) module to create Teams and add members and maintainers.

### 3. Create Repositories, branches and branch protection

Use [github-repository module](https://github.com/FlexibilitySRL/terraform-github/modules/github-repository) module to create one or many repositories and create its branches and protect or not that branches.

### 4. Add a relation between Teams and Repositories

Use [github-team-repository module](https://github.com/FlexibilitySRL/terraform-github/modules/github-team-repository) module to add a relationship between repositories and teams.


## Examples

* [github-membership](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-membership) - Create a github member
* [github-team](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-team) - Create a team and add one member and one maintainer
* [github-repository](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-repository) - Create a repository with two branches and add a protect in one of that branches
* [github-team-repository](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-team-repository) - Add a relationship between team and repository

## Authors

Module managed by [Flexibility](https://github.com/FlexibilitySRL).

## License

MIT License. See LICENSE for full details.