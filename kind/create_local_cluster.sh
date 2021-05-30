#!/bin/sh

# create a cluster
cat <<EOF | kind create cluster --name=sonatype-nexus --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30081
    hostPort: 30081
    protocol: TCP
EOF
