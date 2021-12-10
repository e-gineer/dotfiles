# Nathan's dotfiles

This is a naive first attempt to store my dotfiles in version control. No
scripts, no drama, just ship something and go from there.

## Installing the dotfiles for use

```
cd ~
git clone https://github.com/e-gineer/dotfiles.git
./dotfiles/setup.sh
```

## Secrets in ENV variables

Secrets can be stored in environment variables through a `.env_secrets` file.
It will be automatically loaded (if available) from the `.bashrc`. It should
never be checked into version control and is excluded by `.gitignore`.
