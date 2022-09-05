
# Apigee information

## Definitions
------------------------------------
**Organization**
: An organization is a logical unit, that contains within all the resources for an Apigee deployment. Namely environments, environment groups, and runtime instances. The organization is global and the only setting of it that is localized on a given region is the hosting for the analytics data.

**Environments**
: These are not limited to the use as the usual development, quality assurance, staging, etc. The Google Apigee examples refer to environments as application wise, like payments_dev, catalog_dev, etcetera. Hence why organizations can have up to 30 environments associated.

**Environment groups**
: These allow to group the several environments in dedicated groups, hence 'simulating' the wrapping as for example 'development'. These can then have hostnames assigned, so all associated environments will be reachable via the same hostname.

**Runtime instances**
: These are the actual workers than will respond to the API calls. They can have several environments attached to them and can be set on several regions.

## Prerequisites

### Enabled apis

- Apigee API
- Compute Engine API
- Service Networking API

### Assembling the infrastructure

Since the organization is a global logical container, unless there are legal constraints regarding the hosting of the analytics data it is possible to have a multi-regional deployment, with the recourse to instances in different regions (e.g.: one in a European region and another in a North America region).

### Example workflow
![Google example for Apigee](https://cloud.google.com/static/apigee/docs/api-platform/images/apigee-arch-diagrams/apigee-arch-a.png)


### Network

#### Virtual Private Network

- If we deploy Apigee on it's own project, the network part can be managed by Google, otherwise, we can select to manage it.
- In this case we need to allocate the CIDR.

#### Load balancer

Ideally there will be two layers of load balancers. One global to receive all the external requests and how many internal load balancers to route traffic to any of the environment groups.
