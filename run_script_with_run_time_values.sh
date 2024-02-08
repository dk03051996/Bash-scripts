#!/bin/bash

# Parse command-line arguments
for arg in "$@"; do
    case $arg in
        --name=*)
            cluster_name="${arg#*=}"
            ;;
        --node-group=*)
            node_group_name="${arg#*=}"
            ;;
        --node-type=*)
            node_type="${arg#*=}"
            ;;
        --node-count=*)
            node_count="${arg#*=}"
            ;;
        *)
            echo "Invalid argument: $arg"
            exit 1
            ;;
    esac
done

# Check if all required arguments are provided
if [[ -z $cluster_name || -z $node_group_name || -z $node_type || -z $node_count ]]; then
    echo "Usage: $0 --name=<cluster_name> --node-group=<node_group_name> --node-type=<node_type> --node-count=<node_count>"
    exit 1
fi

# Run eksctl create cluster command with provided values
eksctl create cluster \
  --name "$cluster_name" \
  --version 1.27 \
  --region ap-south-1 \
  --nodegroup-name "$node_group_name" \
  --node-type "$node_type" \
  --nodes "$node_count"




#You can run this script by passing values as mentioned below.
#./create_cluster.sh --name=testkube1 --node-group=testkube --node-type=t3.medium --node-count=2
