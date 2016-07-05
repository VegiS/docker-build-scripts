#!/usr/bin/env bash

# set execute rights for all scripts
find . -name '*.sh' -exec chmod ugo+x {} \;

cd tests/

echo "######## START EXECUTING TESTS ########"

./creating-docker-image-with-bad-parameters.sh
./creating-docker-image-with-no-parameters.sh
./tagging-docker-image-without-parameters.sh
./bumping-versions.sh

exit 0