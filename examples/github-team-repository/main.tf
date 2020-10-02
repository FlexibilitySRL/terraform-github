module "team_repository" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-team-repository"

  team_id     = module.parent_teams["implementation"].id
  admins      = [ "ops", "maintainer" ]
  pushs       = [ "developer" ]
  pulls       = [ "tester" ]
  maintainers = [ "maintainer" ]
}