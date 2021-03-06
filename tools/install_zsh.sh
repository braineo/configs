#!/usr/bin/env zsh
# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s "$(pwd)/zshrc" $HOME/.zshrc
rm ~/.zshenv
ln -s "$(pwd)/zshenv" $HOME/.zshenv
source $HOME/.zshrc
# Install zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
