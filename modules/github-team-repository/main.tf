# ---------------------------------------------------------------------------------------------------------------------
# CREATE A TEAM - REPOSITORY RELATIONSHIP
#
# ---------------------------------------------------------------------------------------------------------------------
locals {
  admin_repositories = { for i in var.admins : lower(i) => "admin" }
  push_repositories  = { for i in var.pushs : lower(i) => "push" }
  pull_repositories  = { for i in var.pulls : lower(i) => "pull" }
  maintain_repositories  = { for i in var.maintainers : lower(i) => "maintain" }
  triage_repositories  = { for i in var.triages : lower(i) => "triage" }


  repositories = merge(local.admin_repositories, local.push_repositories, local.pull_repositories, local.maintain_repositories, local.triage_repositories)
}

resource "github_team_repository" "team_repository" {
  for_each = local.repositories

  repository = each.key
  permission = each.value
  team_id    = var.team_id

}