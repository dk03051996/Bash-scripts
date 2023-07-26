#!/bin/bash

# Set the retention period in days (1 week = 7 days)
retention_days=7

# Get a list of all CloudWatch Log Group names
log_groups=$(aws logs describe-log-groups --query 'logGroups[*].logGroupName' --output text)

# Loop through each log group and set the retention period
for log_group in $log_groups; do
    aws logs put-retention-policy --log-group-name "$log_group" --retention-in-days $retention_days
    echo "Retention period set to $retention_days days for log group: $log_group"
done
