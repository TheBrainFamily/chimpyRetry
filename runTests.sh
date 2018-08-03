#!/bin/bash

CUCUMBER_JSON_OUTPUT=./test-results/chimp/results.json

./node_modules/.bin/chimpy features --jsonOutput=$CUCUMBER_JSON_OUTPUT

E2E_TESTS_RESULT=$?

if [ $E2E_TESTS_RESULT -ne 0 ]; then
    echo "rerunning failing tests: "
    FAILED_TESTS=`node ./node_modules/chimpy/bin/findBrokenFeatures.js $CUCUMBER_JSON_OUTPUT`
    echo $FAILED_TESTS
    ./node_modules/.bin/chimpy $FAILED_TESTS
    E2E_TESTS_RESULT=$?
fi

cat $CUCUMBER_JSON_OUTPUT | ./node_modules/.bin/cucumber-junit > ./test-results/cucumber/e2e-tests.xml

exit $E2E_TESTS_RESULT
