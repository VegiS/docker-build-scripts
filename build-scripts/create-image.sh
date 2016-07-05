#!/usr/bin/env bash

# validate arguments
if [[ -z "$1" || -z "$2"  ]]; then
   echo "There are two arguments needed - repository name and Dockerfile name"
   echo "Like: create-image.sh dockerregistry.cgn.cleverbridge.com/your-repository-name src/Dockerfile"
   exit 1
fi

if [[ ! -e "$2" ]]; then
 echo "### ERROR - the file $2 does not exist"
 exit 1
fi

echo "### INFO - Building Docker image"
echo "  Using dockerfile:  $2"
echo "  With name:         $1"

current_dir=$(pwd)
cd -P -- "$(dirname -- "$2")"
docker build -t="$1" -f Dockerfile .
docker_exitcode=$?
cd $current_dir

if [ $docker_exitcode -ne 0 ]
then
  echo "### ERROR - creating docker image"
  exit 1
fi
