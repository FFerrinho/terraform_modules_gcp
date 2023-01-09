variable "organization_domain" {
  description = "The organization domain."
  type        = string
}

variable "create_folder" {
  description = "Toggle to indicate if the folder needs to be created."
  type        = bool
  default     = false
}

variable "folder_name" {
  description = "The name for the folder where the shared services projects will be hosted."
  type        = string
}

variable "billing_account_name" {
  description = "The name for the billing account associated with the organization."
  type        = string
}

variable "create_billing_subaccount" {
  description = "Toggle to indicate if a billing subaccount needs to be created for this project."
  type        = bool
  default     = false
}

variable "billing_subaccount_name" {
  description = "The name for the billing subaccount. This variable is mandatory only if the toggle to create the billing subaccount was enabled."
  type        = string
  default     = null
}

variable "labels" {
  description = "Labels to attach to resources."
  type        = map(any)
  default = {
    managed = "Terraform"
  }
}

variable "auto_create_network" {
  description = "If the project should have an automatically created VPC."
  type        = bool
  default     = false
}

variable "project_display_name" {
  description = "The display name for the project. Can contain spaces."
  type        = string
}

variable "project_id" {
  description = "The ID for the project. Can't contain spaces."
  type = string

  validation {
    condition = can(regex("/^\\s*$/", var.project_id))
    error_message = "The project ID can't contain spaces. You can use dashes instead."
  }
}
