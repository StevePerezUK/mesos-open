# Mesos Open

This repo will allow you to build an open source Mesos / Marathon cluster on AWS. 


## Mesos Architecture
The architecture consists of a, 
- Highly available mesos/marathon cluster 
- Chronos for Batch scheduling
- Private docker registry with S3 as the storage backend. 
- Marathon-LB, a Haproxy load balancer for managing services
- Ceph, configured as a shared drive across the cluster

<img src="https://github.com/StevePerezUK/mesos-open/blob/master/architecture/mesos-architecture.png?raw=true" alt="Mesos" height="237" width="500">

## AWS Architecture
<img src="https://github.com/StevePerezUK/mesos-open/blob/master/architecture/aws-architecture.png?raw=true" alt="AWS Architecture" height="350" width="500">


## Current Tooling required

- An AWS Account
- CentOs 7
- packer
- terraform
- ansible



