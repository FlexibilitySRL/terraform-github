
variable "commons" {
  description = "A list of commons members."
  type        = set(string)
  default     = []
}

variable "admins" {
  description = "(Optional) A list of admin members."
  type        = set(string)
  default     = []
}


