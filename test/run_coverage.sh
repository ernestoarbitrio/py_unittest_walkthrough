#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

export PYTHONPATH=../src:$PYTHONPATH

COVERAGE_REPORT=$(mktemp)
coverage run -m --source ../src/funprog unittest discover unit_tests -p "*test.py" -b
coverage report --skip-covered -m > $COVERAGE_REPORT

cat $COVERAGE_REPORT
rm -f $COVERAGE_REPORT
