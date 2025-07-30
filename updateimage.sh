#!/bin/bash

# Exit if any command fails
set -e

# Get the build number from Jenkins
BUILD_NUMBER=$1

# Full image name with tag
IMAGE_NAME="ttiwari1005/dockerapp:$BUILD_NUMBER"

# File to update
DEPLOYMENT_FILE="deployment.yaml"

# Update the image line
echo "Updating image in $DEPLOYMENT_FILE to $IMAGE_NAME..."

# This replaces the line containing "image: ttiwari1005/dockerapp" with the new tag
sed -i "s|image: ttiwari1005/dockerapp.*|image: $IMAGE_NAME|" "$DEPLOYMENT_FILE"

echo "Updated image tag to: $IMAGE_NAME"
