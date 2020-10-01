module "repositories" {
  source      = "github.com/flexibility-terraform-modules/terraform-github/tree/master/modules/github-repository?ref=0.0.1"

  name                = "Repository name"
  description         = "Repository description"
  visibility          = "public"

  branchs             = [ "master" , "development" ] 
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