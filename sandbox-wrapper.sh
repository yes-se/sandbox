#!/bin/bash

pushd `dirname $0` > /dev/null
#HOME=`pwd -P`
./sandbox "$@"
popd > /dev/null
