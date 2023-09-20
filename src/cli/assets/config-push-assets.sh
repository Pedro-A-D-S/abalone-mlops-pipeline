#!/bin/bash

cd ~/environment/mlops
git checkout -b etl
cp ~/environment/etl/* .
ls

git add .
git status
git commit -m "initial commit of etl assets"

git push --set-upstream origin etl