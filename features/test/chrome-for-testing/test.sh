#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "validate google-chrome app" command -v google-chrome | grep '/usr/bin/google-chrome'
check "validate chromedriver app" command -v chromedriver | grep '/usr/local/bin/chromedriver'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
