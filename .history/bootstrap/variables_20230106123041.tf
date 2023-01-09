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
  default     = null
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
  type        = map(string)
  default = {
    creator = "devoteam"
    tool    = "terraform"
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

variable "service_account_display_name" {
  description = "The display name for the service account."
  type        = string

  validation {
    condition     = length(var.service_account_display_name) >= 6 && length(var.service_account_display_name) <= 30
    error_message = "Service account display name must be between 6 and 30 characters long."
  }

  validation {
    condition     = can(regex("^[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?(\\.[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?)*$", var.service_account_id))
    error_message = "The service account can only contains the characters comprehended in [a-z]([-a-z0-9]*[a-z0-9])."
  }
}

variable "service_account_description" {
  description = "The description for the service account."
  type        = string
  default     = "Terraform SA for infrastructure automation."

  validation {
    condition     = length(var.service_account_description) <= 256
    error_message = "The description must be under 256 characters."
  }
}

variable "service_account_disabled" {
  description = "If the service account should be disabled. Defaults to false."
  type        = bool
  default     = false
}

variable "sa_member_roles" {
  description = "SA roles to grant to users."
  type        = set(string)
  default     = null
}

variable "sa_users" {
  description = "A list of users that will be able to impersonate de service account."
  type        = set(string)
  default     = null
}

variable "bucket_name" {
  description = "The name for the bucket."
  type        = string
  default     = "tf-state"
}

variable "bucket_location" {
  description = "The location for the bucket."
  type        = string
}

variable "enable_bucket_force_destroy" {
  description = "If the bucket will force destroy even if it still contains files."
  type        = bool
  default     = true
}

variable "bucket_storage_class" {
  description = "The storage class for the bucket."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = var.bucket_storage_class == "STANDARD" || var.bucket_storage_class == "MULTI_REGIONAL" || var.bucket_storage_class == "REGIONAL" || var.bucket_storage_class == "NEARLINE" || var.bucket_storage_class == "COLDLINE" || var.bucket_storage_class == "ARCHIVE"
    error_message = "The storage class must be one of the following: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "enable_bucket_versioning" {
  description = "If the bucket will have versioning enabled."
  type        = bool
  default     = true
}

variable "enable_bucket_uniform_access" {
  description = "If the bucket will use Uniform access or otherwise, if it'll use specific ACLs."
  type        = bool
  default     = true
}
