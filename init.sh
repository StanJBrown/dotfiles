#/bin/sh
set -e  # exit on first error

# determine os
case $(uname -s) in
Linux)
    OS="LINUX"
    ;;
Darwin)
    OS="MAC"
    ;;
esac

install_dependencies(){
    sudo apt-get update
    sudo apt-get install -y \
        xterm \
        exuberant-ctags \
        cmake \
        git \
        automake \
        vim-nox \
        i3 \
        tree \
        xinit \
        xbacklight \
        network-manager-gnome \
        thunar \
        gnome-icon-theme-full \
        pavucontrol \
        tmux \
        clang-5.0 \
        clang-format-5.0 \
        clang-tidy-5.0

        # some tex stuff, this stuff can takea lot of time
        # texlive \
        # texlive-fonts-extra \
        # texlive-formats-extra \
        # texlive-latex-extra \
        # texlive-math-extra 

        # update the alterantives to prefer clang-5.0 over the other possible versions on the system
        sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
        sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
        sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-5.0 1000
        sudo update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-5.0 1000
        sudo update-alternatives --config clang++
        sudo update-alternatives --config clang
        sudo update-alternatives --config clang-format
        sudo update-alternatives --config clang-tidy
}

git_config(){
    git config --global user.name "Stanley Brown"
    git config --global user.email "stan.j.brown@gmail.com"
    git config --global push.default matching
}

init_dotfiles(){
    # REMOVE OLD DOTFILES
    echo "remove old dotfiles"
    rm -rf $HOME/.vim
    rm -f $HOME/.vimrc
    rm -f $HOME/.bash_profile
    rm -f $HOME/.tmux.conf
    rm -rf $HOME/.i3
    rm -f $HOME/.xinitrc
    rm -f $HOME/.Xdefaults
    rm -f $HOME/.muttrc
    rm -rf $HOME/.mutt
    rm -f $HOME/.xbindkeysrc
    rm -f $HOME/.screenlayout
    rm -f $HOME/.gitconfig

    # SYMLINKS
    echo "symlinks dotfiles"
    ln -fs $PWD/vim $HOME/.vim
    ln -fs $PWD/vim/vimrc $HOME/.vimrc
    ln -fs $PWD/tmux/tmux.conf $HOME/.tmux.conf
    ln -fs $PWD/i3 $HOME/.i3
    ln -fs $PWD/configs/inputrc $HOME/.inputrc
    ln -fs $PWD/configs/xinitrc $HOME/.xinitrc
    ln -fs $PWD/configs/Xdefaults $HOME/.Xdefaults
    ln -fs $PWD/configs/xbindkeysrc $HOME/.xbindkeysrc
    ln -fs $PWD/configs/vimperatorrc $HOME/.vimperatorrc
    ln -fs $PWD/configs/bash_profile $HOME/.bash_profile
    echo "source ~/.bash_profile" >> $HOME/.bashrc
    ln -fs $PWD/configs/gitconfig $HOME/.gitconfig
    ln -fs $PWD/screenlayout $HOME/.screenlayout

    return 0
}

init_vim() {
    echo "install vim plugins"
    git submodule init
    git submodule update
    vim -c VundleInstall -c quitall
    exec ./vim/bundle/fzf/install --all

    return 0;
}

# init() {
#     install_dependencies
#     git_config
#     #
#     init_dotfiles
#     init_vim
#     echo "Done! :)"
# }

install_libs() {
    bash scripts/install/install_ceres.bash
    bash scripts/install/install_gtsam.bash
    bash scripts/install/install_opencv3.bash
}
# MAIN
 install_dependencies
# init
# install_libs
# init_dotfiles
# init_vim


