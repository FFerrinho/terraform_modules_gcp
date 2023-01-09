module "tf_state" {
  source = "../"

  bucket_name     = "tf-state"
  bucket_location = "europe-west1"
  bucket_project  = "tb-shared-terraform"
  bucket_labels = {
    "creator" = "devoteam"
    "tool" = "terraform"
  }
}
