#!/bin/bash

git checkout -b master

# Empty the branch
git branch --unset-upstream &&\
git rm -rf .

# Copy the model 
cp -R ~/environment/model/* .

sed -i "s/<AccountId>/${AWS_ACCOUNT_ID}/" ~/environment/mlops/trainingjob.json
sed -i "s/<Region>/${AWS_DEFAULT_REGION}/" ~/environment/mlops/trainingjob.json

# Push the code to master branch
git add . &&\
git commit -m "Initial commit of model assets" &&\
git push --set-upstream origin master

# Set master branch as default
aws codecommit update-default-branch --repository-name mlops --default-branch-name master