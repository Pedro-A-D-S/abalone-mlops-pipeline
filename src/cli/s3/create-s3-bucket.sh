#!/bin/bash

# data bucket

aws s3 mb "s3://${DATA_BUCKET}" --region $AWS_DEFAULT_REGION

aws s3api put-bucket-versioning --bucket "${DATA_BUCKET}" --versioning-configuration Status=Enabled --region $AWS_DEFAULT_REGION

wget https://raw.githubusercontent.com/manifoldailearning/mlops-with-aws-datascientists/main/Section-16-mlops-pipeline/dataset/abalone.csv

# etl data bucket

aws s3 mb "s3://${PIPELINE_BUCKET}" --region $AWS_DEFAULT_REGION &&\
aws s3api put-bucket-versioning --bucket "${PIPELINE_BUCKET}" \
--versioning-configuration Status=Enabled --region $AWS_DEFAULT_REGION