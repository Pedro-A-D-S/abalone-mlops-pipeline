#!/bin/bash

# step 1
curl -O https://bootstrap.pypa.io/get-pip.py &&\
sudo python3 get-pip.py --user --no-warn-script-location &&\
rm get-pip.py &&\
python3 -m pip install -U pip boto3 numpy pandas wget awscli --user

# step 2
wget https://raw.githubusercontent.com/manifoldailearning/mlops-with-aws-datascientists/main/Section-16-mlops-pipeline/mlops-tutorial.zip

# step 3
unzip mlops-tutorial.zip