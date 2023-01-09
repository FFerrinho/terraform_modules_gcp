variable "bucket_name" {
  description = "The name for the bucket."
  type        = string
  default     = "tf-state"
}

variable "bucket_location" {
  description = "The location for the bucket."
  type        = string
}

variable "force_destroy" {
  description = "If the bucket will force destroy even if it still contains files."
  type        = bool
  default     = false
}

variable "bucket_project" {
  description = "The project where the bucket will be hosted."
  type = string
}

variable "bucket_storage_class" {
  description = "The storage class for the bucket."
  type = string
  validation {
    condition = var.bucket_storage_class == "STANDARD" || var.bucket_storage_class == "MULTI_REGIONAL" || var.bucket_storage_class == "REGIONAL" || var.bucket_storage_class == "NEARLINE" || var.bucket_storage_class == "COLDLINE" || var.bucket_storage_class == "ARCHIVE"
    error_message = "The storage class must be one of the following: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "bucket_labels" {
  description = "A map of labels to apply to contained resources."
  default     = {}
  type        = map(string)
}
