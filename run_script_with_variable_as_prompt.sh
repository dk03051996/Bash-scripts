#!/bin/bash

# Prompt the user to enter values for cluster creation
read -p "Enter cluster name: " cluster_name
read -p "Enter node group name: " node_group_name
read -p "Enter node type: " node_type
read -p "Enter number of nodes: " node_count

# Run eksctl create cluster command with provided values
eksctl create cluster \
  --name "$cluster_name" \
  --version 1.27 \
  --region ap-south-1 \
  --nodegroup-name "$node_group_name" \
  --node-type "$node_type" \
  --nodes "$node_count"
