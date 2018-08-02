#!/bin/bash

export DISPLAY=:99.0
if [$CIRCLE_TEST_REPORTS -ne ""]; then
    export CIRCLE_TEST_REPORTS=.
    export CUCUMBER_JSON_OUTPUT=$CIRCLE_TEST_REPORTS/cucumber/results.json
else
    export CUCUMBER_JSON_OUTPUT=./results.json
fi

./node_modules/.bin/chimpy features --jsonOutput=$CUCUMBER_JSON_OUTPUT

E2E_TESTS_RESULT=$?

if [ $E2E_TESTS_RESULT -ne 0 ]; then
    echo "rerunning failing tests: "
    FAILED_TESTS=`node ./node_modules/chimpy/bin/findBrokenFeatures/index.js $CUCUMBER_JSON_OUTPUT`
    echo $FAILED_TESTS
    ./node_modules/.bin/chimpy $FAILED_TESTS
    E2E_TESTS_RESULT=$?
fi

cat $CUCUMBER_JSON_OUTPUT | ./node_modules/.bin/cucumber-junit > $CIRCLE_TEST_REPORTS/e2e-tests.xml

exit $E2E_TESTS_RESULT
