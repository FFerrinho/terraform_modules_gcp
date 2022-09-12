
# Apigee information

## [Terminology](https://cloud.google.com/apigee/docs/api-platform/get-started/basic-concepts)

------------------------------------
**Organization**
: An organization is a container, that holds within all the resources for an Apigee deployment. Namely environments, environment groups, and runtime instances. The organization is global and the only setting of it that is localized on a given region is the hosting for the analytics data.

**Environments**
: These are not limited to the use as the usual development, quality assurance, staging, etc. The Google Apigee examples refer to environments as application wise, like payments_dev, catalog_dev, etcetera. Hence why organizations can have up to 30 environments associated.

**Environment groups**
: These allow to group the several environments in dedicated groups, hence 'simulating' the wrapping as for example 'development'. These can then have hostnames assigned, so all associated environments will be reachable via the same hostname.

**Runtime instances**
: These are the actual workers than will respond to the API calls. They can have several environments attached to them and can be set on several regions.

## [Prerequisites](https://cloud.google.com/apigee/docs/api-platform/get-started/prerequisites)
- Billing account
- GCP project
- [Permissions](https://cloud.google.com/apigee/docs/api-platform/get-started/permissions)

### Enabled apis

- Apigee API
- Compute Engine API
- Service Networking API

### [Assembling the infrastructure](https://app.diagrams.net/?title=apigee.drawio#Uhttps%3A%2F%2Fraw.githubusercontent.com%2FFFerrinho%2Fterraform_modules_gcp%2Fmain%2Fapigee%2Fapigee.drawio)

The first concept that needs to be addressed is the Apigee Organization. Since the organization is a global container, unless there are legal constraints regarding the hosting of the analytics data (which is hosted in a specified region) it is possible to have a multi-regional deployment, with the recourse to instances in different regions (e.g.: one in a European region and another in a North America region).
Afterwards we need to define the deployment model, since we can have it as a full SaaS solution, where Google manages all the resources (from VPC to the runtime instances, etcetera) or a a Hybrid model, in which we can, for example, host runtime instances in a Kubernetes cluster and have full control (and management responsibilities) over them. In my opinion, since we can have encryption keys on the organization and the runtime instances, there is no need to take full control over any part of the Apigee infrastructure, thus relieving the teams from the additional effort. Anyway, even if we decide to opt for the full SaaS solution, we can still manage the VPC for the project and in this case we need to assign the correct CIDR blocks to each component.

### Example workflow
![Google example for Apigee](https://cloud.google.com/static/apigee/docs/api-platform/images/apigee-arch-diagrams/apigee-arch-a.png)


### Network

#### Virtual Private Network

- If we deploy Apigee on it's own project, the network part can be managed by Google, otherwise, we can select to manage it. In this case we need to allocate the CIDR.
- In order to allow multiple projects to communicate with Apigee it's necessary to either peer VPCs or have some network application routing the flows across projects. In the case of Avast, since we already have a VPC structure with NVAs, the later option would be preferable.

#### Load balancer

Ideally there will be two layers of load balancers. One global to receive all the external requests and how many internal load balancers to route traffic to any of the environment groups.
