module "members" {
  source      = "github.com/flexibility-terraform-modules/terraform-github/tree/master/modules/github-member"

  admins      = [ "maintainer", "admin-company" ]
  commons     = [ "developer", "customer", "tester", "ops" ]
}