# MNDDEV2
## What Is This?
This is part of our development environment for Shopware (https://www.shopware.com) using 
Dockware (https://www.dockware.io).

It contains a template for a basic project structure, as well es scripts, helpers and 
default configuration files.
Its use requires a Dockware image. Usually this will be the Dockware essentials image.

## Please Note
We are happy to share this with you and hope you find it useful. That being said, it may neither be pretty nor mature.
Currently, it's more like a collection of quick hacks to make things work for us.
So it may not work for you out of the box.

Please note that this public repo is currently not our main repository and we do not (yet) intend to maintain this
project for public use. We do intend to push updates from now and then, though, and if we get some help we will respond
and this might grow to a useful toolkit. So, if you find it useful, please let us know. If you find a bug or problem
or have questions, please create an issue on github. Or even better: provide a pull request :)

## Quick Overview

### Installation
* We use a main directory for our code projects like /DEV
* Place this repo in this directory, like /DEV/_MNDDEV2
* check what /install.sh does and if you are happy with it, run it in your home directory.
  
### Project Setup
* Create your first project structure by: cd /DEV && mnddev2-crate-project
* a directory called "project" will be created. It's a copy of the templates/project directory for now
* cd to your project directory and do a: git init && git add . && git commit -m "mnddev2 rocks"
* customize the config files in your project.
    * Choose one of the _gitignore templates as your .gitignore
    * edit the .env file according to your needs. Comments there should be self explanatory.
    * when setting up the docker-compose file you can choose between creating a dedicated docker volume for your codebase or using bind mount. When using bind mount provide the -b parameter to the mnddev2-dw-provision command. See below
    * of course you can use a docker-compose.override for your local needs. It is ignored in our default .gitignore
    * Change your Shopware Database credentials to use those provided in your project .env
    
### Working With Projects

#### mnddev2-dw-ssh
use this in your project folder to connect to your project container

#### mnddev2-dw-up
This launches your dockware container.

#### mnddev2-dw-provision
This provisions your dockware container with your project data and runs some basic setup actions

#### mnddev2-dw-dump
Dumps your running database to /db/autodump-TIME/

#### mnddev2-dw-stop
Dumps your current database (wiht mnddev2-dw-dump) and stops your project container.

#### mnddev2-create-project
Create a new project structure to work with


## Author
MND Next GmbH

https://www.mndnext.de


## License

This project is licensed under the MIT License.

