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
