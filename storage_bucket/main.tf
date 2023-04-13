resource "random_id" "main" {
  byte_length = var.byte_length
}

resource "google_storage_bucket" "main" {
  name                        = var.random_id == true ? "${var.name}-random_id.main.dec" : var.name
  location                    = var.location
  project                     = var.project
  force_destroy               = var.force_destroy
  storage_class               = var.storage_class
  labels                      = var.labels
  uniform_bucket_level_access = var.uniform_bucket_level_access
  public_access_prevention    = var.public_access_prevention

  versioning {
    enabled = var.versioning
  }
}
