#!/bin/bash

set -e

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
# check "validate powerlevel10k theme files" $([ -d "$ZSH_CUSTOM/themes/powerlevel10k" ] && [ ! -z "$( ls -A "$ZSH_CUSTOM/themes/powerlevel10k" )" ]) || exit 1
# check "validate powerlevel10k config file" $([ -f "$HOME/.p10k.zsh" ]) || exit 1
# check "validate powerlevel10k theme setup" grep -q "powerlevel10k/powerlevel10k" $HOME/.zshrc

check "validate powerlevel10k theme files" [ -d "$ZSH_CUSTOM/themes/powerlevel10k" ] && [ ! -z "$( ls -A "$ZSH_CUSTOM/themes/powerlevel10k" )" ] || exit 1
check "validate powerlevel10k config file" [ -f "$HOME/.p10k.zsh" ] || exit 1
check "validate powerlevel10k theme setup" grep -q "powerlevel10k/powerlevel10k" $HOME/.zshrc

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
