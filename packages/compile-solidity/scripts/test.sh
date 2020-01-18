#!/usr/bin/env bash

set -o errexit
echo "Here we are in compile-solidity test.sh" 
pwd
ls

echo $@

if [ "$CI" = true ]; then
  mocha "./test/**" "./test/**/*" --timeout 10000 $@
else
  rm -rf ./node_modules/.cache/truffle
  mocha "./test/**" "./test/**/*" --invert --grep native --timeout 10000 $@
fi
