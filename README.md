# Nathan's dotfiles

This is a naive first attempt to store my dotfiles in version control. No
scripts, no drama, just ship something and go from there.

## Installing the dotfiles for use

```
cd ~
git clone https://github.com/e-gineer/dotfiles.git
ln -s .vimrc dotfiles/vimrc
ln -s .vim dotfiles/vim
```

## Setting up node, npm and jake for install scripts

```
sudo apt-get install -y python-software-properties
sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs npm
sudo npm install -g jake
sudo npm install -g coffee-script
```

## Notes & caveats

The vim-coffee-script bundle was cloned from github but then had the git info
manually deleted before being added to this repository. This is a quick win
to ensure it is portable with these dotfiles, but will make updating it a little
harder than it should be based on https://github.com/kchmck/vim-coffee-script.
