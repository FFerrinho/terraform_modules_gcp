module "apigee_x" {
  source = "../"

  project_id       = "xppd-l4test1-prj-zero-88"
  display_name     = "test_apigee"
  description      = "A test deployment of Apigee."
  analytics_region = "europe-west1"

  apigee_environments = [
    "dev1",
    "dev2",
    "stg1",
    "stg2"
  ]
  environment_groups = {
    dev = {
      environments = [
        "dev1",
        "dev2"
      ]
      hostnames = [
        "dev.api.somedomain.com"
      ]
    }
    stg = {
      environments = [
        "stg1",
        "stg2"
      ]
      hostnames = [
        "stg.api.somedomain.com"
      ]
    }
  }

  apigee_instances = {
    "europe" = {
      location     = "europe-west-1"
      environments = "dev1"
    }
    "us" = {
      location     = "europe-west-1"
      environments = "stg1"
    }
  }
}
