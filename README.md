# test-actions

testing actions

![test_scan](https://github.com/maarten-boot/test-actions/actions/workflows/main.yml/badge.svg?event=push)

The current workflow shows a simplefied way to run tests on code after both `push` and `pull-request`.
As is well documented `pull-request` events only happen if there are no merge conflicts.
But note that a `pull-request` event will actually run before the merge takes place!

1. The workflow starts with a checkout of the code.
    * In the case of a `push` this reflects the updated code base with the `push` changes applied.
    * In the case of a `pull-request` this reflects the code base with the `pull-request` changes applied.

2. We then build a whl package locally on the runner.

3. The whl file then gets scanned with `reversinglabs/rl-scanner`.

4. The resulting status and report are allways extracted and processed.

5. we update the commit or pull-request status
