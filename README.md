# Github Repositories module

These types of resources are supported:

* [github_repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository)
* [github_branch](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch)
* [branch_protection](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection)
* [github_membership](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/membership)
* [github_team](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team)
* [github_team_membership](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_membership)
* [github_team_repository](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_repository)

## Terraform versions

Terraform 0.13. Pin module version to `>= 0.13.0`. Submit pull-requests to `master` branch.

## Providers version

[Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs) version `3.0.0`

## Features

1. **Create repository** Create repository
2. **Create branches** Create branches and create a branch protection or not
3. **Create teams** Create teams and add members and maintainers
4. **Add teams to repository** Add teams to repositories

## Usage

`github-membership`:
```hcl
module "members" {
  source      = "github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-member"

  admins      = [ "maintainer", "admin-company" ]
  commons     = [ "developer", "customer", "tester", "ops" ]
}
```

`github-repository`:
```hcl
module "repositories" {
  source      = "github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-repository"

  name                = "Repository name"
  description         = "Repository description"
  visibility          = "public"

  branchs             = [ "master" , "development", "release" ] 
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

`github-team`:
```hcl
module "parent_teams" {
  source      = "github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-team"
  name        = "Implementation"
  description = "This is the description of the team" 
  members     = [ "implementation-user" ]
  maintainers = [ "github-maintainer" ]
}

module "child_teams" {
  source          = "github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-team"

  name            = "Developer team"
  parent_team_id  = module.parent_teams["Implementation"].id
  members         = [ "implementation-dev" ]
  maintainers     = [ "github-maintainer" ]

  depends_on = [
    module.parent_teams
  ]
}
```

`github-team-repository`:
```hcl
module "team_repository" {
  source      = "github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-team-repository"

  team_id     = module.parent_teams["implementation"].id
  admins      = [ "ops", "maintainer" ]
  pushs       = [ "developer" ]
  pulls       = [ "tester" ]
  maintainers = [ "maintainer" ]
}
```


### 1. Create Repositories, branches and branch protection

Use [github-repository module](https://github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-repository) module to create one or many repositories and create its branches and protect or not that branches.

### 2. Create Github Members

Use [github-membership module](https://github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-membership) module to add github members to company.

### 3. Create Teams and add Github Members

Use [github-team module](https://github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-team) module to create Teams and add members and maintainers.

### 4. Add a relation between Teams and Repositories

Use [github-team-repository module](https://github.com/FlexibilitySRL/terraform-github/tree/master/modules/github-team-repository) module to add a relationship between repositories and teams.


## Examples

* [github-repository](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-repository) - Create a repository with two branches and add a protect in one of that branches
* [github-membership](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-membership) - Create a github member
* [github-team](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-team) - Create a team and add one member and one maintainer
* [github-team-repository](https://github.com/FlexibilitySRL/terraform-github/tree/master/examples/github-team-repository) - Add a relationship between team and repository

## Authors

Module managed by [Flexibility](https://github.com/FlexibilitySRL).

## License

Apache 2 Licensed. See LICENSE for full details.