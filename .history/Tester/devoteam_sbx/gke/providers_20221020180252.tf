terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.41.0"
    }
  }
}

provider "google" {
  # Configuration options
}

terraform {
 backend "gcs" {
   bucket                      = "tf-state-9a0c3f821700e35e"
   prefix                      = "sa-terraform" 
   impersonate_service_account = "terraform@gcloud-cd-playground-fferrinho.iam.gserviceaccount.com"
 }
}
