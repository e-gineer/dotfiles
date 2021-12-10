# On Mac, .bash_profile is used for new terminals, not
# just on login. So, use .bashrc in those cases too per
# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

# Stop MacOS from showing the please use zsh nag
export BASH_SILENCE_DEPRECATION_WARNING=1

# bash-completion for auto complete in programs like steampipe
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
