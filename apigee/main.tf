resource "google_project_service" "project" {
  project = var.project_id
  service = "apigee.googleapis.com"
}

resource "google_apigee_organization" "apigee_org" {
  project_id                           = var.project_id
  display_name                         = var.display_name
  description                          = var.description
  analytics_region                     = var.analytics_region
  authorized_network                   = var.authorized_network
  runtime_type                         = var.runtime_type
  billing_type                         = var.billing_type
  runtime_database_encryption_key_name = var.runtime_database_encryption_key_name

  timeouts {
    create = "45m"
  }
}

resource "" "name" {
  
}
