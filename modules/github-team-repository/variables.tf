# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "team_id" {
  description = "(Required) The team id to asociate."
  type        = string
}

variable "pulls" {
  description = "A list repositories for pull permission."
  type        = set(string)
  default     = []
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------
variable "admins" {
  description = "(Optional) A list repositories for admin permission."
  type        = set(string)
  default     = []
}

variable "maintainers" {
  description = "(Optional) A list repositories for maintain permission."
  type        = set(string)
  default     = []
}

variable "triages" {
  description = "(Optional) A list repositories for triage permission."
  type        = set(string)
  default     = []
}

variable "pushs" {
  description = "(Optional) A list repositories for push permission."
  type        = set(string)
  default     = []
}


