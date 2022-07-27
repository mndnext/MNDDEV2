#!/bin/sh
# this is a global before hook and will be executed on every environment before the env specific hook will be executed
# this hook can be used to prepare the environment, eh remove specific files

# set path to the root path of the project:
ROOT_PATH=$(dirname "$0")/../../..
cd $ROOT_PATH

# the main script starts here


