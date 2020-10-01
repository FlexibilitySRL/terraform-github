# ------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ------------------------------------------------------------------------------
output "repository" {
  description = "The full team object."
  value       = github_repository.repository
}
