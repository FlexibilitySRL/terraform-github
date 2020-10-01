# ---------------------------------------------------------------------------------------------------------------------
# CREATE A GITHUB MEMBER IN THE ORGANIZATION
#
# ---------------------------------------------------------------------------------------------------------------------
locals {
  admin_members = { for i in var.admins : lower(i) => "admin" }
  common_members  = { for i in var.commons : lower(i) => "member" }

  members = merge(local.admin_members, local.common_members)
}

resource "github_membership" "membership" {
  for_each = local.members

  username = each.key
  role     = each.value
}