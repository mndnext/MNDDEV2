#!/bin/sh

# setenv.sh tool for setting up the environments
# Version 1.0.0 (2022-06-24)
APP_VERSION=1.1.0

#set -e
cd $(dirname "$0")
ROOT_PATH=$(dirname "$0")/..

echo ROOT_PATH = $ROOT_PATH

banner() {
    echo "##################################"
    echo "MND NEXT environment tool V $APP_VERSION"
    echo "##################################\n"
}

precheck() {
  if [ $1 = "global" ]
    then
      echo "\e[31mERROR:\e[39m: global env cant be set! Use different environments"
      exit 1
  fi

  if [ ! -d $1 ]
    then
      echo "\e[31mERROR:\e[39m: Environment $1 was not found"
      exit 1
  fi

  if [ ! -d $1/files ]
    then
      echo "\e[31mERROR:\e[39m: files folder in env/$1 environment was not found"
      exit 1
  fi

}


#Copy all files from env/<envname>/files
#param: $1 = envname
copy_files(){
  files_path=$1/files

  if [ -d $files_path ]
    then
      echo "Copying files from $files_path to root"
      #cp $files_path .. -rfT
      rsync -av $files_path/ .. --quiet --exclude .gitkeep
  fi
}

# set the environment
# this function will copy all files from env/<envname>/files/* to the root folder and also execute hooks
setenv(){
  exec_hook global before
  exec_hook $1 before

  copy_files global
  copy_files $1

  exec_hook $1 after
  exec_hook global after
}


# execute a hook
# a hook is basically a normal shell script which resides in the hook folder.
exec_hook() {

  hook_file=$1/hooks/$2.sh

  if [ -f $hook_file ]
    then
      chmod +x $hook_file
      if [ ! -x $hook_file ]
        then
          echo "\e[31mERROR:\e[39m $2.sh file for $1 environment is not executable"
          exit 1
      fi

      echo "Executing $1 $2 hook"
      $hook_file
  fi
}

###############################################################################

banner

if [ $# -eq 0 ]
  then
    echo "\e[31mERROR:\e[39m: No arguments supplied. Call this script with the name of the environment you want to set."
    echo "Available environments are:"
    find . -maxdepth 1 -mindepth 1 -type d ! -name 'global' -exec basename {} \;
    exit 1
fi

precheck $1
setenv $1

echo "\e[92mDONE\e[39m"