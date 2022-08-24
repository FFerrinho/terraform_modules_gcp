variable "project_id" {
  description = "The Project ID for the Apigee deployment."
  type        = string
}

variable "display_name" {
  description = "The display name for the Apigee organization."
  type        = string
  default     = null
}

variable "description" {
  description = "The description for the Apigee organization."
  type        = string
  default     = null
}

variable "analytics_region" {
  description = "The primary region where the analytics data will be hosted."
  type        = string
  default     = null
}

variable "authorized_network" {
  description = "The network to be peered with Apigee. Only to use if runtime_type is set to 'Cloud'."
  type        = string
  default     = null
}

variable "runtime_type" {
  description = "The runtime type can be 'CLOUD' or 'HYBRID'"
  type        = string
  default     = "CLOUD"
}

variable "billing_type" {
  description = "The billing type for the Apigree organization."
  type        = string
  default     = null
}

variable "runtime_database_encryption_key_name" {
  description = "CloudKMS key name to use in encrypting the data stored in the runtime instances. Update is not allowed after the organization is created. If not specified, a Google-Managed encryption key will be used."
  type        = string
  default     = null
}
