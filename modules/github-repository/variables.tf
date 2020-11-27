# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "(Required) The name of the repository."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------

variable "description" {
  description = "(Optional) A description of the repository."
  type        = string
  default     = ""
}

variable "homepage_url" {
  description = "(Optional) A homepage url of the repository."
  type        = string
  default     = ""
}

variable "visibility" {
  description = "(Optional) Define if the repository is private or not. Default is private."
  type        = string
  default     = "private"
}

variable "has_issues" {
  description = "(Optional) Define if the repository has issue tab or not. Default is true."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "(Optional) Define if the repository has project tab or not. Default is false."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "(Optional) Define if the repository has wiki tab or not. Default is false."
  type        = bool
  default     = false
}

variable "is_template" {
  description = "(Optional) Define if the repository is a template or not. Default is false."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "(Optional) Define if the repository allow merge method. Default is true."
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "(Optional) Define if the repository allow squash method. Default is true."
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "(Optional) Define if the repository allow rebase method. Default is true."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "(Optional) Define if the repository delete the branch after merge. Default is false."
  type        = bool
  default     = false
}

variable "has_downloads" {
  description = "(Optional) Define if the repository has download tabs or not. Default is false."
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "(Optional) Define if the repository autoinitialize or not. Default is false."
  type        = bool
  default     = false
}

variable "gitignore_template" {
  description = "(Optional) The gitignore template for the repository"
  type        = string
  default     = null
}

variable "license_template" {
  description = "(Optional) The license template for the repository"
  type        = string
  default     = null
}

variable "archived" {
  description = "(Optional) Define if the repository has to be archived or not. Default is false."
  type        = bool
  default     = false
}

variable "branchs" {
  description = "(Optional) A list branch to create."
  type        = set(string)
  default     = []
}

variable "protection_branchs" {
  description = "(Optional) A branch protection config for the repository."
  type        = any
  default     = []
}

variable "template" {
  description = "(Optional) Template Data."
  type        = list(map(string))
  default     = []
}

variable "topics" {
  description = "(Optional) Topics."
  type        = list(string)
  default     = []
}



