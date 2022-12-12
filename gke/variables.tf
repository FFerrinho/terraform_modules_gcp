variable "cluster_name" {
  description = "The name for the GKE cluster."
  type        = string
}

variable "cluster_description" {
  description = "A description for the cluster."
  type        = string
  default     = null
}

variable "location" {
  description = "The location for the cluster master. If a zone is specified the cluster will be zonal and if a region is specified a regional cluster with multiple masters."
  type        = string
  default     = null
}

variable "node_locations" {
  description = "A list of zone for the location of the nodes."
  type        = set(string)
  default     = null
}
