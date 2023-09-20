#!/bin/bash

export AWS_DEFAULT_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
aws configure set default.region ${AWS_DEFAULT_REGION}
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
export VERIFY_ROLE_ARN="arn\:aws\:iam::${AWS_ACCOUNT_ID}\:role/MLOps"
export DATA_BUCKET="data-${AWS_DEFAULT_REGION}-${AWS_ACCOUNT_ID}"
export PIPELINE_BUCKET="mlops-${AWS_DEFAULT_REGION}-${AWS_ACCOUNT_ID}"
echo "export AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID" >> ~/.bashrc
echo "export VERIFY_ROLE_ARN=$VERIFY_ROLE_ARN" >> ~/.bashrc
echo "export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" >> ~/.bashrc
echo "export DATA_BUCKET=$DATA_BUCKET" >> ~/.bashrc
echo "export PIPELINE_BUCKET=$PIPELINE_BUCKET" >> ~/.bashrc