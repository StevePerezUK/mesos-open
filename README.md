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
AWS architecture is,
- A single VPC
- Three private subnets, each in thier own AZ
- An internet facing load balancer
- Three T3 medium instances giving 4GB Ram and 2 vCPU
- EBS g2 SSD storage
- Route 53 for external routing

<img src="https://github.com/StevePerezUK/mesos-open/blob/master/architecture/aws-architecture.png?raw=true" alt="AWS Architecture" height="350" width="500">


## Current Tooling required

- An AWS Account
- CentOs 7
- packer
- terraform
- ansible

## Build Sequence 
### Create an AMI using packer 
Goto the packer directory and follow the README to create 
### Create the AWS VPC 
Goto the terraform directory and follow the README to create
### Create the mesos cluster
Goto to the ansible directory and follow the README to create


