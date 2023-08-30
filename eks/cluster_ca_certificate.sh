#!/bin/bash

cluster_ca_certificate=$(aws eks describe-cluster --name $1 --query cluster.certificateAuthority.data)
echo "{\"data\":${cluster_ca_certificate}}"