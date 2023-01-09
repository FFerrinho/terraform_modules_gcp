data "google_client_config" "current" {}

data "google_project" "apigee" {
    project_id = var.project_id
}

data "google_compute_network" "vpc" {
    name = var.authorized_network
    project = var.project_id
}
