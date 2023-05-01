#!/bin/bash

set -eo pipefail

# Verify that scripts are installed.
if ! which xcbeautify > /dev/null; then
  echo "warning: xcbeautify not installed, skipping..."
  exit 1
fi

if ! which junit2html > /dev/null; then
  echo "warning: junit2html not installed, skipping..."
  exit 2
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
pushd $REPO_ROOT

REPORT_DIRECTORY=junit-reports
OUTPUT_XML=test-output.xml
OUTPUT_HTML=test-output.html

swift test | xcbeautify --quiet --report junit --report-path $REPORT_DIRECTORY --junit-report-filename $OUTPUT_XML
junit2html $REPORT_DIRECTORY/$OUTPUT_XML --report-matrix $REPORT_DIRECTORY/$OUTPUT_HTML

popd
