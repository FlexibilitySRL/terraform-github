module "members" {
  source      = "github.com/FlexibilitySRL/terraform-github/modules/github-member"

  admins      = [ "maintainer", "admin-company" ]
  commons     = [ "developer", "customer", "tester", "ops" ]
}