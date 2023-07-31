#!/bin/bash

# This will simulate the CI pipeline on our behalf for the sake of testing until we make a new CI pipeline for it
set -e

new_version=$1

echo "New version: $new_version"

# Simulate release of the new docker image
docker tag nginx:1.23.3 otmaneki/nginx:$new_version

# Push the new version to dockerhub or any registry you want
docker push otmaneki/nginx:$new_version

# Create a tmp folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

git clone git@github.com:cRYP70n-13/nginx-gitops.git

# Update the image
sed -i '' -e "s/otmaneki\/nginx:.*/otmaneki\/nginx:$new_version/g" $tmp_dir/my-app/deployment.yaml

# Commit and push the changes to Github
cd $tmp_dir
git add .
git commit -m "Feat/update image to $new_version"
git push

# Finally cleanup the mess
rm -rf $tmp_dir
