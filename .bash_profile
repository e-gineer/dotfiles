# On Mac, .bash_profile is used for new terminals, not
# just on login. So, use .bashrc in those cases too per
# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
