#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

cp $REPO_ROOT/bin/hooks/pre-commit $REPO_ROOT/.git/hooks
