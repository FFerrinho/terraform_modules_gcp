locals {
  folder_id = var.create_folder ? data.google_active_folder.folder.id : null
}
