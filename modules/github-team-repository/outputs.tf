# ------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ------------------------------------------------------------------------------
output "team_repository" {
  description = "The full team repository object."
  value       = github_team_repository.team_repository
}
