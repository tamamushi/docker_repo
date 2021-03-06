
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi


## 【インストールバージョン確認】
## $ pyenv install -l
## 
## 【pythonのインストール】
## $ pyenv install 2.7.10
## 
## インストール内容の確認
## $ pyenv versions
##  system(set by /home/XXXXX/.pyenv/version)
## 
## 【環境構築】
## 仮想環境を構築する。構築するのみで設定しないと使用できない。
## $ pyenv virtualenv 2.7.10 virtual_env（仮想環境名）
## 
## 仮想環境を適用するディレクトリでpyenv localを実行して
## 仮想環境を適用する。
## $ cd hoge_dir
## $ pyenv local virtual_env


