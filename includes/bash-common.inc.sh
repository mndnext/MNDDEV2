# (c) 2020-2021 MND Next GmbH
# function library for MNDDEV scripts

function getTemplateDir {

  echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd ../templates && pwd )"

}

function getMNDDEVDir {

  echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd ../ && pwd )"

}

function checkProjectDir {

  if [ ! -f $(pwd)/.MNDDEV2 ]; then
      echo "MNDDEV ERROR: command must be run from project root dir. (.MNDDEV2 not found)";
      exit 1
  fi
}

function getProjectDir {

  checkProjectDir

  echo $(pwd)

}

function loadProjectEnv {

  checkProjectDir

  # load project env variables
  if [ -f $(pwd)/.env ]; then
      source $(pwd)/.env
  fi

}

function getDateTimeStringDay {

  echo $(date +"%F")

}

function getDateTimeStringMinute {

  echo $(date +"%F")

}

function getDateTimeStringSeconds {

  echo $(date +"%F-%H.%M.%S")

}