# (c) 2020-2021 MND Next GmbH

source $(dirname "$0")/includes/bash-common.inc.sh

echo "installing MNDDEV2 ..."

MnddevBinDir="$(getMNDDEVDir)/bin"

echo "" >> ~/.bash_profile
echo "# MNDDEV 2 installation:" >> ~/.bash_profile
echo "if [ -d \"$MnddevBinDir\" ] ; then" >> ~/.bash_profile
echo "    PATH=\"$MnddevBinDir:\$PATH\"" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
echo "export PATH" >> ~/.bash_profile

echo "done."
echo "please execute 'source ~/.bash_profile' or relogin"
echo "also: update gitconfig from resources/ if necessary"
