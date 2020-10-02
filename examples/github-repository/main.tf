module "repositories" {
  source              = "github.com/FlexibilitySRL/terraform-github/modules/github-repository"

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