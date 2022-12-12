resource "google_container_cluster" "gke" {
  name = var.cluster_name
  description = var.cluster_description
  location = var.location
  node_locations = var.node_locations
  addons_config {
    
  }
}
