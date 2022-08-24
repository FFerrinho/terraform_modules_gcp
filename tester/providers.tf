terraform {
  required_version = ">= 1.2.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }

  experiments = [module_variable_optional_attrs]
}

provider "google" {
  # Configuration options
}
