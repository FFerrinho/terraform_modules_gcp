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

variable "bucket_labels" {
  description = "A map of labels to apply to contained resources."
  default     = {}
  type        = map(string)
}
