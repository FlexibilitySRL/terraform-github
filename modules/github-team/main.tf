# ---------------------------------------------------------------------------------------------------------------------
# CREATE A GITHUB TEAM AND TEAM MEMBERSHIPS
#
# Create a Github team and add users as either members or maintainers. Users that aren't a member of the managed
# organization yet will receive an invite and hence not be part of the team before they accept the invitation and
# fulfill potential requirements such as enabled 2FA.
# ---------------------------------------------------------------------------------------------------------------------

resource "github_team" "team" {
  name           = var.name
  description    = var.description
  privacy        = var.privacy
  parent_team_id = var.parent_team_id
  ldap_dn        = var.ldap_dn

  depends_on = [var.module_depends_on]
}

locals {
  maintainers = { for i in var.maintainers : lower(i) => "maintainer" }
  members     = { for i in var.members : lower(i) => "member" }

  memberships = merge(local.maintainers, local.members)
}

resource "github_team_membership" "team_membership" {
  for_each = local.memberships

  team_id  = github_team.team.id
  username = each.key
  role     = each.value

  depends_on = [var.module_depends_on]
}
