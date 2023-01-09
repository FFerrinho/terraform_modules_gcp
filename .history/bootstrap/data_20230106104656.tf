data "google_organization" "organization" {
  domain = var.organization_domain
}

data "google_active_folder" "folder" {
  display_name = var.folder_name
  parent       = join(",", ["organizations/", "1234"]) #data.google_organization.organization.id])
}
