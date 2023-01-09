resource "google_project" "project" {
  name = var.project_name
  project_id = var.project_id
  org_id = data.google_organization.organization.id
}
