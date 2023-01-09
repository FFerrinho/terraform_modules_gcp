variable "account_name" {
  description = "The name for the account, which will be built with the google e-mail format."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = optional(string)
}

variable "description" {
  description = "The description for the service account."
  type        = optional(string)
}

variable "disable_service_account" {
  description = "If the service account is disabled."
  type        = optional(bool)
  default     = false
}

variable "project" {
  description = "The project to where the service account will be created."
  type        = string
}
