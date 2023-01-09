resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "google_storage_bucket" "terraform" {
  name          = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
  location      = var.bucket_location
  force_destroy = var.enable_bucket_force_destroy
  project       = var.bucket_project
  storage_class = var.bucket_storage_class

  versioning {
    enabled = var.enable_bucket_versioning
  }

  labels                      = var.bucket_labels
  uniform_bucket_level_access = var.enable_bucket_uniform_access

  /* lifecycle {
    prevent_destroy = var.enable_prevent_destroy
  } */
}
