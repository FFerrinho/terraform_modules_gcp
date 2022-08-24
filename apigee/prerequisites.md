# Prerequisites

## Enable apis
- Apigee API
- Compute Engine API
- Service Networking API

## Logical organization
The current license allows for two organizations with 10 environments each. The Avast team requested to have one organization for EU and another for US, but in my opinion, unless there is indeed a different set of APIs for each zone, it will only created additional complexity without real benefit. The suggested use would be one organization for a testing like environment, were teams can test things pertaining Apigee itself and/or the APIs, and then another organization for the actual workload, with multiple environments (test, dev, qa, stg and prod for example).
The proposed architecture will comprise of a global load balancer, which will receive requests near the costumer/partner and then work in the internal Google network, on which the latency will be highly reduced and thus will little to no expected impact on the end use of the API.

## Network
- Dedicated VPC?
- 
