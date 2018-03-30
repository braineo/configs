# Install

# EMACS

## Install in guest mode
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/braineo/configs/master/tools/installspacemacs.sh)"
```

## Use stow to symlink config files
``` bash
sudo apt install stow
brew install stow # macOS
stow --verbose=3 -R zsh -t $HOME
```

