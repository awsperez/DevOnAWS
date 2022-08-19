#!/bin/bash

AWS_PROFILE="LOCAL_PROFILE"
# Bucket name expected from the command line
BUCKET_NAME=$1 
REGION="AWS_REGION"

# Empty the bucket first
aws s3 rm s3://$BUCKET_NAME --recursive --profile=$AWS_PROFILE

# Delete the bucket
aws s3api delete-bucket --bucket $BUCKET_NAME --profile=$AWS_PROFILE