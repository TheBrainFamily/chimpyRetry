# Chimpy CircleCI example
This is an example of how to set up Chimpy on CircleCI with parallelisation and retrying flaky tests.

There is very few files here so they should be self explanatory, but do please to ask questions and create issues.

You can take at a result of a example run [https://circleci.com/gh/TheBrainFamily/chimpyRetry/19](here).

# Disclaimer:

We don't want to encourage writing flaky tests, using arbitrary .pauses(), things like that.
Make sure your tests are as stable as reasonably possible.
We've been using chimpy with codebases that have ~1000 e2e tests. 
Even if your tests fail 0.1% , this kind of test run will fail everytime and makes maintanance and new features development a nightmare.

Debugging tests that almost never fail is super hard, time consuming, with minimal return.
If a test fails 1 out of 2 or 3 times, you will be able to properly debug and verify a fix. 
If it fails 1 / 100, it gets close to impossible to verify a fix.

# Need help?

If you need help feel free to read a bit more about us at http://team.thebrain.pro or reach me personally at lgandecki@thebrain.pro .
We are maintainers of chimpy (previously chimp), and are a group of highly passionated software developers that are mainly focused on making automated tests awesome.
We would love to help you make your codebase more testable, set up Continuous Integration/Continuous Delivery pipelines, help with refactoring your code, or even work on new features for you (but only if you allow us to put in testing first!)
