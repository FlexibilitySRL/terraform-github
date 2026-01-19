# ---------------------------------------------------------------------------------------------------------------------
# CREATE A GITHUB REPOSITORY, TEAM MEMBERSHIPS AND ASSIGN THE TEAM TO REPOSITORIES WITH PERMISSIONS
#
# Create a Github team and add users as either members or maintainers. Users that aren't a member of the managed
# organization yet will receive an invite and hence not be part of the team before they accept the invitation and
# fulfill potential requirements such as enabled 2FA.
# This module also accepts a list of repositories to that the team can be added with "admin", "push", or "pull"
# permissions.
# ---------------------------------------------------------------------------------------------------------------------



resource "github_repository" "repository" {
  name                = var.name
  description         = var.description
  homepage_url        = var.homepage_url

  # Only set visibility if explicitly provided and different from default
  visibility          = var.visibility

  has_issues          = var.has_issues
  has_projects        = var.has_projects
  has_wiki            = var.has_wiki
  is_template         = var.is_template 

  allow_merge_commit  = var.allow_merge_commit 
  allow_squash_merge  = var.allow_squash_merge
  allow_rebase_merge  = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge

  has_downloads       = var.has_downloads
  auto_init           = var.auto_init
  gitignore_template  = var.gitignore_template
  license_template    = var.license_template

  archived            = var.archived

  topics              =var.topics

  dynamic "template" {
    for_each = var.template
    content {
      owner = template.value["owner"]
      repository = template.value["repository"]
    }
  }

  # Prevent drift from ETAG changes and accidental deletions
  lifecycle {
    ignore_changes = [etag]
    prevent_destroy = true
  }
}


resource "github_branch" "development" {
  repository  = github_repository.repository.name

  # Exclude master branch when auto_init is true (GitHub creates it automatically)
  for_each    = var.auto_init ? toset([for branch in var.branchs : branch if branch != "master"]) : toset(var.branchs)
  branch      = each.key
  source_branch = "master"  # Create from master branch
  
  # Ensure repository exists before creating branches
  depends_on  = [github_repository.repository]
}

# Create branch protection rules
resource "github_branch_protection" "branch_protection" {
  repository      = github_repository.repository.name
  
  for_each        = var.protection_branchs

  branch          = can(each.value.branch_name_pattern) ? each.value.branch_name_pattern : each.key
  
  # Depend on repository and branches
  depends_on      = [
    github_repository.repository,
    github_branch.development,
  ]
  
  enforce_admins  = can(each.value.enforce_admin) ? each.value.enforce_admin : false

  require_signed_commits = can(each.value.require_signed_commits) ?  each.value.require_signed_commits : false

  dynamic "required_pull_request_reviews" {
    for_each = each.value.required_approving_review_count > 0 ? [ "required_pull_request_reviews" ] : []
    content {
      dismiss_stale_reviews           = can(each.value.dismiss_stale_reviews) ? each.value.dismiss_stale_reviews : false
      dismissal_users                 = can(each.value.dismiss_stale_reviews) ? each.value.dismiss_stale_reviews : []
      dismissal_teams                 = can(each.value.dismissal_teams) ? each.value.dismissal_teams: []
      required_approving_review_count = can(each.value.required_approving_review_count) ? each.value.required_approving_review_count : 1
      require_code_owner_reviews      = can(each.value.require_code_owner_reviews) ? each.value.require_code_owner_reviews : false
    }
  }

  dynamic "required_status_checks" {
    for_each = can(each.value.required_status_checks_stricts) ? [ "required_status_checks" ] : []
    content {
      strict   = can(each.value.required_status_checks_stricts) ? each.value.required_status_checks_stricts  : false 
      contexts = can(each.value.required_status_checks_contexts) ? each.value.required_status_checks_contexts : []
    }
  }

  dynamic "restrictions" {
    for_each = ((can(each.value.restrictions_users) ? length(each.value.restrictions_users): 0) +
               (can(each.value.restrictions_teams) ? length(each.value.restrictions_teams) : 0) +
               (can(each.value.restrictions_apps) ? length(each.value.restrictions_apps) : 0)) > 0 ? [ "restrictions" ] : []
    content {
      users  = can(each.value.restrictions_users) ? each.value.restrictions_users : []
      teams  = can(each.value.restrictions_teams) ? each.value.restrictions_teams : []
      apps   = can(each.value.restrictions_apps) ? each.value.restrictions_apps : []
    }
  }

  # Prevent drift from manual changes to team restrictions
  lifecycle {
    ignore_changes = [restrict_pushes]
  }
}


