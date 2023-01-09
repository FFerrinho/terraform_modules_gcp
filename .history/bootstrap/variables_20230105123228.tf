variable "organization_domain" {
  description = "The organization domain."
  type        = string
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
  type = bool
  default = false
}
