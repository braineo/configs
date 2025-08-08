# Install

## Use stow to symlink config files
``` bash
sudo apt install stow
brew install stow # macOS
stow --verbose=3 -R zsh -t $HOME
```

## Install stow from source

If the distro does not come with stow >= version 2.4.1, install it manually to support `dot-` file name.

1. Download from https://www.gnu.org/software/stow/
2. `sudo cpan Test::Output`
3. untar stow
4. `./configure && make install`
