#!/bin/sh
# Script to setup some of my usual zsh setup

# Install zsh

# Change default Shell to zsh
## Tip: If replacing bash, users may want to move some code from ~/.bashrc to ~/.zshrc (e.g. the prompt and the aliases) and from ~/.bash_profile to ~/.zprofile (e.g. the code that starts the X Window System).
chsh -s /bin/zsh
#homectl update --shell=/bin/zsh _user_

# Install oh-my-zsh (plugin manager?)
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install theme (powerlevel10k)
## Install font: Meslo, hack NF, etc...
## Install p10k from github
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Alternative for arch-linux
# yay -S --noconfirm zsh-theme-powerlevel10k-git
# echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install plugins

## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


## zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# add plugin to the list of plugins
# plugins = (other plugins... zsh-syntax-highlighting zsh-autosuggestions)


# updating p10k: git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
