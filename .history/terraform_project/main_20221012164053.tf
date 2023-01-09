resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "google_storage_bucket" "terraform" {
  name = var.bucket_name
  location = var.bucket_location
  force_destroy = var.enable_force_destroy
  project = var.bucket_project
  storage_class = var.bucket_storage_class
  
  lifecycle_rule {
    
  }

  versioning {
    
  }

  labels = var.bucket_labels
}
