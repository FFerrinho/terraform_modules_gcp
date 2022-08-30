
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

Since the organization is a global logical container, unless there are legal constraints regarding the hosting of the analytics data.
### Network

- Dedicated VPC? 
