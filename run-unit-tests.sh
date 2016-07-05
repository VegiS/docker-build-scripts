#!/usr/bin/env bash

# set execute rights for all scripts
find . -name '*.sh' -exec chmod ugo+x {} \\;

cd tests/

echo "######## START EXECUTING TESTS ########"
echo "######## INFO some extra output is expected due negative testing ########"

./creating-docker-image-with-bad-parameters.sh
./creating-docker-image-with-no-parameters.sh
./tagging-docker-image-without-parameters.sh
./bumping-versions.sh
