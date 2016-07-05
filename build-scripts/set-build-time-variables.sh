#!/usr/bin/env bash

if [[ -z "$1" || -z "$2" ]]; then
 echo "Please give the the name of the CI stage and the path to the version file as arguments!"
 echo "Usage: ./set-build-time-variables.sh build src/VERSION "
 exit 1
fi

if [ $( ls build-time-variables.sh ) ]; then rm build-time-variables.sh; fi

touch build-time-variables.sh

echo '#!/usr/bin/env bash' > build-time-variables.sh
echo "export GIT_SHORTHASH=$(git log --max-count=1 --pretty=format:%h)" >> build-time-variables.sh
echo "export BUILD_VERSION=$(cat $2)-$1-$BUILD_NUMBER" >> build-time-variables.sh