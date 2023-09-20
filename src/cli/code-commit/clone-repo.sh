#!/bin/bash

# Config credentials
git config --global credential.helper 'aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true\

# Clone code-commit repo
cd ~/environment &&\
git clone https://git-codecommit.${AWS_DEFAULT_REGION}.amazonaws.com/v1/repos/mlops