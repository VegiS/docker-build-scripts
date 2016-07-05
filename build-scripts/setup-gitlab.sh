#!/usr/bin/env bash

if [[ -z "$1" ]]; then
 echo "Please enter the repository namespace for the gitlab project"
 echo "Like: PaaS"
 exit 1
fi

if [[ -z "$2" ]]; then
 echo "Please enter the repository name for the gitlab project"
 echo "Like: test-api"
 exit 1
fi

if [[ -z "$3" ]]; then
 echo "Please enter your gitlab token"
 echo "Like: xxxxxxxxxxxxxxxxxxxx"
 exit 1
fi

status_code=$(curl -s -o /dev/null -w "%{http_code}" --header "PRIVATE-TOKEN: $3" -X POST "https://git.cgn.cleverbridge.com/api/v3/projects?name=$2&namespace=$1")

if [ "$status_code" == "201" ]
then
  echo "Created repository $1/$2"
else
  echo "Could not create repository $1/$2"
  echo "HTTP status code: $status_code"
fi

if [ $? -ne 0 ]
then
  echo "### ERROR - creating gitlab project '$1' (exitcode: $?)"
  exit 1
fi
