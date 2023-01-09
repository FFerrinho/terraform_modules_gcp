# Creating a new Landing Zone on Google Cloud Platform

## Assumptions

For this guide we're assuming that some steps have already been followed, like creating the organization and deciding the structure (folders, projects, shared resources, etc.). So we're focusing on steps like preparing for IaC (with Terraform) and ensuring the base services for project creation.
With that purpose, this module allows the creation of the top level folder

## Required resources

In order to have a proper bootstrap and prepare the environment for use, the following actions and resources are necessary:

1. Billing
2. Project for shared resources, e.g. Terraform SA
3. Storage for Terraform state
4. User accounts that can use Terraform with the provided SA

## Initial steps

1. First we need to check the existing IAM users, service accounts and their respective permissions. This is important since you need to ensure you have the necessary permissions to execute the required actions and prepare the project. For this we can use some gcloud CLI commands:

``` bash
gcloud projects get-iam-policy project_id
```

This should output something similar to this:

``` yaml
bindings:
- members:
  - serviceAccount:service-***********@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
- members:
  - serviceAccount:service-***********@gcp-sa-gkenode.iam.gserviceaccount.com
  role: roles/container.nodeServiceAgent
- members:
  - serviceAccount:service-***********@container-engine-robot.iam.gserviceaccount.com
  role: roles/container.serviceAgent
- members:
  - serviceAccount:service-***********@containerregistry.iam.gserviceaccount.com
  role: roles/containerregistry.ServiceAgent
- members:
  - serviceAccount:terraform@project_id.iam.gserviceaccount.com
  - serviceAccount:***********@cloudservices.gserviceaccount.com
  role: roles/editor
- members:
  - user:user_id@email.com
  role: roles/owner
- members:
  - serviceAccount:service-***********@gcp-sa-pubsub.iam.gserviceaccount.com
  role: roles/pubsub.serviceAgent
- members:
  - serviceAccount:terraform@project_id.iam.gserviceaccount.com
  role: roles/storage.admin
etag: BwXsf8afTpw=
version: 1
```
