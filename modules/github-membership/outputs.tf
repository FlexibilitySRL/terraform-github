# ------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ------------------------------------------------------------------------------
output "membership" {
  description = "The full membership object."
  value       = github_membership.membership
}
