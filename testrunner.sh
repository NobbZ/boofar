#!/usr/bin/env bash

RUBYS=jruby,1.9.3,2.0.0,2.1.0,2.2.0

echo "Installing bundler"
rvm $RUBYS --verbose do gem install bundler

echo "Updating bundle for all ruby versions"
rvm $RUBYS --verbose do bundle

echo "Running the tests"
rvm $RUBYS --verbose do rake spec