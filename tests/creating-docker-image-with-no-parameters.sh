#!/usr/bin/env bash

function test_creating_docker_image_with_no_parameters () {

    ../build-scripts/create-image.sh

     assertEquals 1 $?
}

## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"