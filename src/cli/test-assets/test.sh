#!/bin/bash

cd ~/environment/mlops && \
git checkout -b test

git rm -rf .

cp -R ~/environment/tests/system_test/* .

sed -i "s/<Threshold>/3.1/" ~/environment/mlops/buildspec.yml

git add -A &&\
git commit -m "Initial commit of system test assets" &&\
git push --set-upstream origin test