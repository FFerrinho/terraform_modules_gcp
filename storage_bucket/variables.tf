variable "random_id" {
  description = "If a numeric random ID is to be used as suffix for resources names."
  type        = bool
  default     = true
}

variable "byte_length" {
  description = "The byte length for the random ID."
  type        = number
  default     = 2
}

variable "name" {
  description = "The name for the bucket."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{5,29}$", var.name))
    error_message = "The name must be a valid bucket name."
  }
}

variable "location" {
  description = "The location for the bucket."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{5,29}$", var.location))
    error_message = "The location must be a valid location ID."
  }
}

variable "project" {
  description = "The project for the bucket."
  type        = string

  validation {
    condition     = can(regex("^([a-z][-a-z0-9]{6,30}[a-z0-9])$", var.project))
    error_message = "The project must be a valid project ID."
  }
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket."
  type        = bool
  default     = false
}

variable "storage_class" {
  description = "The storage class for the bucket."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = can(regex("^(STANDARD|NEARLINE|COLDLINE|ARCHIVE)$", var.storage_class))
    error_message = "The storage class must be one of STANDARD, NEARLINE, COLDLINE, or ARCHIVE."
  }
}

variable "versioning" {
  description = "Whether to enable versioning for the bucket."
  type        = bool
  default     = false
}

variable "labels" {
  description = "A map of labels for the bucket."
  type        = map(string)
  default = {
    managed = "terraform"
  }
}

variable "uniform_bucket_level_access" {
  description = "Whether to enable uniform bucket-level access for the bucket."
  type        = bool
  default     = false
}

variable "public_access_prevention" {
  description = "Whether to enable public access prevention for the bucket."
  type        = string
  default     = "inherited"

  validation {
    condition     = can(regex("^(inherited|enforced)$", var.public_access_prevention))
    error_message = "The public access prevention must be one of inherited or enforced."
  }
}
