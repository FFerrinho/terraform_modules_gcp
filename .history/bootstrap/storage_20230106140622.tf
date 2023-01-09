resource "google_storage_bucket" "terraform" {
  name          = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
  location      = var.bucket_location
  force_destroy = var.enable_bucket_force_destroy
  project       = google_project.project.name
  storage_class = var.bucket_storage_class

  versioning {
    enabled = var.enable_bucket_versioning
  }

  labels = merge(
    var.labels,
    {
      managed = "terraform"
      purpose = "automation"
    }
  )
  
  uniform_bucket_level_access = var.enable_bucket_uniform_access

  lifecycle {
    prevent_destroy = true
  }
}
