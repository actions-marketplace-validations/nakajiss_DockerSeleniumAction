#!/bin/sh
pip install --upgrade pip
pip install --no-cache pytest
pip install --no-cache allure-pytest
pip install --no-cache selenium
echo "Execution is being started"
echo "**************************"

pytest $@ --alluredir=results

echo "**************************"
echo "Execution has been completed, please check the artifacts to download the results."
