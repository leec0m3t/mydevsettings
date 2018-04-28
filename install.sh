#!/bin/bash

apps=(
'asciinema'
'software-properties-common'
'python3-software-properties'
'python-software-properties'
'build-essential'
'lolcat'
'zsh'
'fonts-powerline'
'ttf-ancient-fonts'
'python3-dev'
'python-dev'
'python3-pip'
'python-pip'
'pipenv'
'nodejs'
)

apt-add-repository -y ppa:zanchey/asciinema
apt-add-repository -y ppa:pypa/ppa
apt-get -y update

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

for app in "${apps[@]}"
do
	apt-get -y install $app
done

pip3 install --upgrade pip
pip install --upgrade pip

zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P $ZSH_CUSTOM/themes/
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bullet-train"/g' ~/.zshrc

npm install hexo-cli -g hexo-deployer-git -- save
pip3 install thefuck
