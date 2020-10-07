# ------------------------------------------------------------------------------
# OUTPUT CALCULATED VARIABLES (prefer full objects)
# ------------------------------------------------------------------------------

output "id" {
  description = "The ID of the team."
  value       = github_team.team.id
}

output "team_name" {
  description = "The ID of the team."
  value       = github_team.team.name
}

output "slug" {
  description = "The Slug of the team."
  value       = github_team.team.slug
}

# ------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ------------------------------------------------------------------------------

output "team" {
  description = "The full team object."
  value       = github_team.team
}

output "team_memberships" {
  description = "A list of all team memberships."
  value       = github_team_membership.team_membership
}
