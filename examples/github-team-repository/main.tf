module "team_repository" {
  source      = "github.com/flexibility-terraform-modules/terraform-github/tree/master/modules/github-team-repository"

  team_id     = module.parent_teams["implementation"].id
  admins      = [ "ops", "maintainer" ]
  pushs       = [ "developer" ]
  pulls       = [ "tester" ]
  maintainers = [ "maintainer" ]
}