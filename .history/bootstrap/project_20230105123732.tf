resource "google_folder" "folder" {
  for_each     = var.create_folder
  display_name = var.folder_name
  parent       = "organizations/${data.google_organization.organization.id}"
}

resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
  org_id     = data.google_organization.organization.id
  folder_id  = var.create_folder ? google_folder.folder.id : data.google_active_folder.folder.id
}
