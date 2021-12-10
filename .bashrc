export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\033[33;1m\]\w\[\033[m\] $ "

# include secret env var definitions
if [ -f $HOME/dotfiles/.env_secrets ]; then
  . $HOME/dotfiles/.env_secrets
fi

# Per https://opensource.com/article/19/5/python-3-default-mac
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nathan/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/nathan/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nathan/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/nathan/Downloads/google-cloud-sdk/completion.bash.inc'; fi
