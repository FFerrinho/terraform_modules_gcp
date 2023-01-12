# This will create the storage bucket to store the terraform state for future executions of the IaC pipeline.
resource "google_storage_bucket" "main" {
  name          = "${var.bucket_name}-${random_id.random.hex}"
  location      = var.bucket_location
  force_destroy = var.enable_bucket_force_destroy
  project       = google_project.main.project_id
  storage_class = var.bucket_storage_class

  versioning {
    enabled = var.enable_bucket_versioning
  }

  labels = merge(
    var.labels,
    {
      managed = "terraform"
      purpose = "tf-state"
    }
  )

  uniform_bucket_level_access = var.enable_bucket_uniform_access

  # For testing purposes the lifecycle is disabled, but in production it is advisable to enable since it'll protect the state files from an accidental bucket deletion.
  lifecycle {
    prevent_destroy = false
  }
}
