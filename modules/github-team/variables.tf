# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "(Required) The name of the team."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------

variable "description" {
  description = "(Optional) A description of the team."
  type        = string
  default     = ""
}

variable "privacy" {
  description = "(Optional) The level of privacy for the team. Must be one of secret or closed."
  type        = string
  default     = "closed"
}

variable "parent_team_id" {
  description = "(Optional) The ID of the parent team, if this is a nested team."
  type        = number
  default     = null
}

variable "ldap_dn" {
  description = "(Optional) The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise."
  type        = string
  default     = null
}

variable "maintainers" {
  description = "(Optional) A list of users that will be added to the current team with maintainer permissions."
  type        = set(string)
  default     = []
}

variable "members" {
  description = "(Optional) A list of users that will be added to the current team with member permissions."
  type        = set(string)
  default     = []
}

# ------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# ------------------------------------------------------------------------------

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends_on. Default is []."
  default     = []
}
