#!/bin/sh
# vim: set ts=4 :

cmd=`basename $0`

if [ $# -ne 3 ]; then
	echo "You need specified 3 arguments for this script" 1>&2
	echo "You'r specify arguments just only $#. invalid arguments " 1>&2
	echo ""
	echo "$cmd [username] [user_home]"
	exit 1
fi

USERNAME=$1
UHOME=$2
RUBY_VERSION=$3

## rbenv install
git clone https://github.com/sstephenson/rbenv.git $(echo $UHOME)/.rbenv
mkdir -p $(echo $UHOME)/.rbenv/shims $(echo $UHOME)/.rbenv/versions $(echo $UHOME)/.rbenv/plugins

git clone https://github.com/sstephenson/ruby-build.git $(echo $UHOME)/.rbenv/plugins/ruby-build
$(echo $UHOME)/.rbenv/plugins/ruby-build/install.sh
git clone git://github.com/sstephenson/rbenv-default-gems.git $(echo $UHOME)/.rbenv/plugins/rbenv-default-gems


chown -R $(echo $USERNAME) $(echo $UHOME)/.rbenv
chgrp -R $(echo $USERNAME) $(echo $UHOME)/.rbenv
chmod -R g+rwxXs $(echo $UHOME)/.rbenv

echo "export PATH=$(echo $UHOME)/.rbenv/shims:$(echo $UHOME)/.rbenv/bin:\$PATH" >> $(echo $UHOME)/.bashrc
echo 'eval "$(rbenv init -)"' >> $(echo $UHOME)/.bashrc

## rubyのインストール
export CONFIGURE_OPTS=--disable-install-doc
cd $(echo $UHOME)
sudo -i -u $(echo $USERNAME) sh -c "rbenv install $(echo $RUBY_VERSION)"
sudo -i -u $(echo $USERNAME) sh -c "rbenv global $(echo $RUBY_VERSION)"
sudo -i -u $(echo $USERNAME) sh -c "rbenv rehash"
