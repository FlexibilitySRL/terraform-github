module "parent_teams" {
  source      = "github.com/flexibility-terraform-modules/terraform-github/tree/master/modules/github-team"
  name        = "Implementation"
  description = "This is the description of the team" 
  members     = [ "implementation-user" ]
  maintainers = [ "github-maintainer" ]
}

module "child_teams" {
  source          = "github.com/flexibility-terraform-modules/terraform-github/tree/master/modules/github-team"

  name            = "Developer team"
  parent_team_id  = module.parent_teams["Implementation"].id
  members         = [ "implementation-dev" ]
  maintainers     = [ "github-maintainer" ]

  depends_on = [
    module.parent_teams
  ]
}