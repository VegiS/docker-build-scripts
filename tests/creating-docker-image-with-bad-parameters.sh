#!/usr/bin/env bash


function test_creating_docker_image_if_dockerfile_does_not_exist () {

    ../build-scripts/create-image.sh dockerregistry.cgn.cleverbridge.com/your-repository-name /path/to/not/existing/Dockerfile

    assertEquals 1 $?
}

function test_creating_docker_image_if_docker_image_does_not_exist () {

    ../build-scripts/create-image.sh dockerregistry.cgn.cleverbridge.com/your-repository-name ./_fixture/Dockerfile

    assertEquals 1 $?
}

## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"