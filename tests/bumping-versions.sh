#!/usr/bin/env bash

function test_bump_without_parameters () {

    ../build-scripts/bump.sh

    assertEquals 2 $?
}

function test_bump_with_invalid_version_name () {

    ../build-scripts/bump.sh wonderland

    assertEquals 2 $?
}

function test_if_creates_VERSION_file_if_it_does_not_exist () {

    rm VERSION

    ../build-scripts/bump.sh minor

    assertEquals "0.1.0" "$(cat VERSION)"
}

function test_bumping_major_version_number () {

    ../build-scripts/bump.sh major

    assertEquals "1.0.0" "$(cat VERSION)"
}

function test_bumping_minor_version_number () {

    ../build-scripts/bump.sh minor

    assertEquals "1.1.0" "$(cat VERSION)"
}

function test_bumping_patch_version_number () {

    ../build-scripts/bump.sh patch

    assertEquals "1.1.1" "$(cat VERSION)"
}


function test_bumping_major_version_number_for_second_time () {

    ../build-scripts/bump.sh major

    assertEquals "2.0.0" "$(cat VERSION)"
}


## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"