output "teams" {
    value = merge(module.parent_teams, module.child_teams)
}