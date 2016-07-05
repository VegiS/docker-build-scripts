#!/usr/bin/env bash

if [[ -z "$1" ]]; then
 echo "Please give the name of the image to tag"
 echo "Like: dockerregistry.com/your-repository-name:1.0.0-build-01"
 exit 1
fi

if [[ -z "$2" ]]; then
 echo "Please give the the name of the Docker image complete with tag"
 echo "Like: dockerregistry.com/your-repository-name:1.0.0-test-01"
 exit 1
fi

echo "### INFO - tagging docker image $1 tag $2"
docker tag -f $1 $2
exitcode=$?
if [ $exitcode -gt 0 ]; then
    echo "### ERROR - docker tag failed (exitcode: $exitcode)"
    exit 1
fi
