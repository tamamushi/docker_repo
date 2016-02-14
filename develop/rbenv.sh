#!/bin/sh
##
## /etc/profile.d/rbenv.sh
## 
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
	export PATH="$RBENV_ROOT/bin:$PATH"
	eval "$(rbenv init -)"
fi

## 【インストールバージョン確認】
## インストール可能なrubyのバージョンを確認
## $ rbenv install -l
## 
## 【Rubyのインストール】
## rubyをインストールし、グローバル設定を行う。
## # rbenv install 2.2.3
## # rbenv global 2.2.3
##
## インストール内容の確認
## $ rbenv versions
##  2.2.3-p173 (set by /home/XXXXX/.rbenv/version)
##
## 【設定の確認】
## # ruby -v
## ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
## 
## 【環境構築】
## rbenv localでディレクトリ固有のバージョンをを適用出来る。
## $ cd hoge_dir
## $ rbenv local 2.2.3


