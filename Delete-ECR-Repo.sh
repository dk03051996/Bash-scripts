#!/bin/bash

# Write your  AWS region
AWS_REGION="your-aws-region"

# To get the list Get the list of ECR repositories
repositories=$(aws ecr describe-repositories --region $AWS_REGION --query 'repositories[*].repositoryName' --output text)

# Perform for loop through each repository and check if it ends with "staging"
for repo in $repositories; do
    if [[ "$repo" == *staging ]]; then
        echo "Deleting ECR repository: $repo"
        aws ecr delete-repository --repository-name "$repo" --force --region $AWS_REGION
    fi
done
