resource "google_project_service" "apigee" {
  project = var.project_id
  service = "apigee.googleapis.com"
}

resource "google_kms_key_ring" "apigee_keyring" {
  name     = "apigee-keyring"
  location = var.analytics_region
}

resource "google_kms_crypto_key" "apigee_key" {
  name            = "apigee-key"
  key_ring        = google_kms_key_ring.apigee_keyring.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_project_service_identity" "apigee_sa" {
  provider = google-beta
  project  = data.google_project.apigee.project_id
  service  = google_project_service.apigee.service
}

resource "google_kms_crypto_key_iam_binding" "apigee_sa_keyuser" {
  crypto_key_id = google_kms_crypto_key.apigee_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:${google_project_service_identity.apigee_sa.email}",
  ]
}


resource "google_apigee_organization" "org" {
  project_id                           = data.google_project.apigee.project_id
  display_name                         = var.display_name
  description                          = var.description
  analytics_region                     = var.analytics_region
  authorized_network                   = data.google_compute_network.vpc.id
  runtime_type                         = var.runtime_type
  billing_type                         = var.billing_type
  runtime_database_encryption_key_name = var.runtime_database_encryption_key_name

  timeouts {
    create = "45m"
  }
}

resource "google_apigee_environment" "apigee_env" {
  for_each = toset(var.apigee_environments)
  org_id   = google_apigee_organization.org.id
  name     = each.key
}

resource "google_apigee_envgroup" "apigee_envgroup" {
  for_each  = var.environment_groups
  org_id    = google_apigee_organization.org.id
  name      = each.key
  hostnames = each.value.hostnames
}

resource "google_apigee_envgroup_attachment" "env_to_envgroup_attachment" {
  for_each    = { for pair in local.env_envgroup_pairs : "${pair.envgroup}-${pair.env}" => pair }
  envgroup_id = google_apigee_envgroup.apigee_envgroup[each.value.envgroup].id
  environment = google_apigee_environment.apigee_env[each.value.env].name
}

resource "google_apigee_instance" "apigee_instance" {
  for_each                 = var.apigee_instances
  org_id                   = google_apigee_organization.org.id
  name                     = each.key
  location                 = each.value.location
  ip_range                 = each.value.ip_range
  disk_encryption_key_name = each.value.disk_encryption_key_name
  consumer_accept_list     = each.value.consumer_accept_list
}

resource "google_apigee_instance_attachment" "apigee_instance_attachment" {
  for_each    = var.apigee_instances
  instance_id = google_apigee_instance.apigee_instance[each.key].id
  environment = each.value.environments
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/viewer"
    members = [
      "user:YOUR_USER",
    ]
  }
}

resource "google_apigee_environment_iam_policy" "policy" {
  for_each    = toset(var.apigee_environments)
  org_id      = google_apigee_organization.org.id
  env_id      = google_apigee_environment.apigee_env[each.key].id
  policy_data = data.google_iam_policy.admin.policy_data
}
