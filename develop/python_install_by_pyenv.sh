#!/bin/sh
# vim: set ts=4 :

cmd=`basename $0`

if [ $# -ne 3 ]; then
	echo "You need specified 2 arguments for this script" 1>&2
	echo "You'r specify arguments just only $#. invalid arguments " 1>&2
	echo ""
	echo "$cmd [username] [user_home]"
	exit 1
fi

USERNAME=$1
UHOME=$2
PYTHON_VERSION=$3

## pyenv install
git clone git://github.com/yyuu/pyenv.git $(echo $UHOME)/.pyenv/ 
git clone https://github.com/yyuu/pyenv-pip-rehash.git $(echo $UHOME)/.pyenv/plugins/pyenv-pip-rehash
git clone git://github.com/yyuu/pyenv-virtualenv.git $(echo $UHOME)/.pyenv/plugins/pyenv-virtualenv

chown -R $(echo $USERNAME) $(echo $UHOME)/.pyenv;
chgrp -R $(echo $USERNAME) $(echo $UHOME)/.pyenv;
chmod -R g+rwxXs $(echo $UHOME)/.pyenv

echo "export PATH=$(echo $UHOME)/.pyenv:$(echo $UHOME)/.pyenv/bin:\$PATH" >> $(echo $UHOME)/.bashrc
echo 'eval "$(pyenv init -)"' >> $(echo $UHOME)/.bashrc

## pythons install
echo "[Installation python 2.2.7]"
cd $(echo $UHOME)
sudo -i -u $(echo $USERNAME) sh -c "pyenv install $(echo $PYTHON_VERSION)";
sudo -i -u $(echo $USERNAME) sh -c "pyenv global $(echo $PYTHON_VERSION)";

