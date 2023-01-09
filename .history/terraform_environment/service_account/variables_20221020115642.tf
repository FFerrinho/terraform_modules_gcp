variable "create_service_account" {
  description = "Feature toggle to create the service account."
  type = bool
  default = false
}

variable "set_sa_binding" {
  description = "Feature toggle to set the IAM bindings required for service account use and impersonation."
  type = bool
  default = false
}

variable "account_name" {
  description = "The name for the account, which will be built with the google e-mail format."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = string
  default = null
}

variable "description" {
  description = "The description for the service account."
  type        = string
  default = ""
}

variable "disable_service_account" {
  description = "If the service account is disabled."
  type        = bool
  default     = false
}

variable "project" {
  description = "The project to where the service account will be created."
  type        = string
}

variable "sa_token_creators" {
  description = "List of user accounts that are allowed to impersonate this service account."
  type = set(string)
}
