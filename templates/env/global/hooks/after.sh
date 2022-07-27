#!/bin/sh
# this is a global after hook and will be executed on every environment after the env specific after hook was executed
# this hook can be used do some after tasks, eg. set permissions or execute some scripts

# set path to the root path of the project:

ROOT_PATH=$(dirname "$0")/../../..
cd $ROOT_PATH

# the main script starts here
