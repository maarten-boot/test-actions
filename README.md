# test-actions

testing actions

![test_scan](https://github.com/maarten-boot/test-actions/actions/workflows/main.yml/badge.svg?event=push)

The current workflow shows a simplefied way to run tests on code after both `push` and `pull-request`.
As is well documented `pull-request` events only happen if there are no merge conflicts.

1. The workflow starts with a checkout of the code.
    * In the case of a `push` this reflects the updated code base with the `push` changes applied.
    * In the case of a `pull-request` this reflects the code base with the `pull-request` changes applied.

2. We then build a whl package locally on the runner.

3. The whl file then gets scanned with `reversinglabs/rl-scanner`.

4. The resulting status and report are allways extracted and processed.
    * If the scanner detects issues and produces a FAIL message (and a exit code -1) we do not proceed to tag and release.

5. Only in the case of `pull-request` we proceed to tag and release the current code.

## Investigating:
Note that just creating a pull request will in this case run the action and produce a release
(while the merge itself has not yet taken place).
When we then merge manually, we will create a push action.
