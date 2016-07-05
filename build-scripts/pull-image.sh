#!/usr/bin/env bash

if [[ -z "$1" ]]; then
 echo "Please give the repository name for the docker image as first argument"
 echo "Like: dockerregistry.com/your-repository-name"
 exit 1
fi

docker pull $1

if [ $? -ne 0 ]
then
  echo "### ERROR - pulling docker image '$1' (exitcode: $?)"
  exit 1
fi
