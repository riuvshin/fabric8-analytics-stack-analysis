#!/usr/bin/env bash

echo "*****************************************"
echo "*** Cyclomatic complexity measurement ***"
echo "*****************************************"
radon cc -s -a -i venv util tagging_platform evaluation_platform

echo "*****************************************"
echo "*** Maintainability Index measurement ***"
echo "*****************************************"
radon mi -s -i venv util tagging_platform evaluation_platform

echo "*****************************************"
echo "*** Unit tests ***"
echo "*****************************************"

python -m pytest -p no:cacheprovider --cov=analytics_platform/ --cov=util/ --cov=tagging_platform/ --cov=evaluation_platform/ --cov-report term-missing --ignore=evaluation_platform/uranus/src/evaluate_data.py -vv /tests/unit_tests/
