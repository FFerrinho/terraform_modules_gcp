locals {
  folder_id = var.create_folder ? google_folder.main[0].id : data.google_active_folder.main.name
}
