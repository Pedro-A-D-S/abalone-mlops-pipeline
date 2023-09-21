#!/bin/bash

unset parameters
parameters="$parameters ParameterKey=ImageRepoName,ParameterValue=%s"
parameters="$parameters ParameterKey=ImageTagName,ParameterValue=%s"
parameters="$parameters ParameterKey=ModelName,ParameterValue=%s"
parameters="$parameters ParameterKey=RoleName,ParameterValue=%s"

# Execute the package command
cd ~/environment/pipeline && \
aws cloudformation package --template-file mlops-pipeline.yml \
--s3-bucket $PIPELINE_BUCKET --s3-prefix abalone-pipeline/artifacts \
--output-template-file mlops-pipeline-output.yml

aws s3 cp ~/environment/abalone.csv "s3://${DATA_BUCKET}/input/raw/abalone.csv" --region $AWS_DEFAULT_REGION

aws cloudformation create-stack --stack-name abalone-pipeline \
--template-body file://~/environment/pipeline/mlops-pipeline-output.yml \
--parameters $(printf "$parameters" "abalone" "latest" "abalone" "MLOps") \
--capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND