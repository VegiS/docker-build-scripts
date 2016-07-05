#!/usr/bin/env bash

function test_tagging_docker_image_with_no_parameters () {

    ../build-scripts/tag-image.sh

    assertEquals 1 $?
}


function test_tagging_docker_if_only_tag_given () {

    ../build-scripts/tag-image.sh dockerregistry.cgn.cleverbridge.com/your-repository-name:1.0.0-build-01 ''

    assertEquals 1 $?
}

function test_tagging_docker_if_only_new_tag_given () {

    ../build-scripts/tag-image.sh '' dockerregistry.cgn.cleverbridge.com/your-repository-name:1.0.0-test-01

    assertEquals 1 $?
}

## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"