#!/usr/bin/env bash

if [[ -z "$1" ]]; then
 echo "Please give the name of the image to push"
 echo "Like: dockerregistry.cgn.cleverbridge.com/your-repository-name:1.0.0"
 exit 1
fi

echo "### INFO - Pushing Docker image"
echo "  Image name:         $1"

docker push $1

if [ $? -ne 0 ]
then
  echo "### ERROR - pushing docker image"
  exit 1
fi