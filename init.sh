#!/bin/bash

get_relative_path() {
    cd `dirname $0`
    if [ "${PWD}" == "${HOME}" ]; then
        echo "error: try not to put `basename $0` on home ${HOME}"
        exit
    fi
    file_path=${PWD#"${HOME}/"}
    echo "setting files are in ${file_path}/"
}

set_os_settings() {
    if [ "${TERM_PROGRAM}" == "Apple_Terminal" ]; then
        echo "Use OS X"
        bash_file=".bash_profile"
        # install homebrew
        read -p "brew install done? " confirm
        # for building vim with python3 and its plugin
        brew install python3 node rg
        # for building ctags
        brew install autoconf automake pkg-config pcre2
        # for fonts in terminal
        brew install font-source-code-pro-for-powerline
        # for using git and its completion
        brew install git bash-completion
    elif [ "${os_name}" == "Linux" ]; then
        echo "Use Ubuntu"
        bash_file=".bash_aliases"
        sudo apt-get update
        # for vim
        sudo apt-get install -y ack-grep ctags
    else
        echo "error: Not Ubuntu or MAC"
        exit
    fi
    ln -s ${file_path}/bash_settings ${bash_file}
    mkdir -p tool/bin
    echo "set bash: ${bash_file}"
}

set_vim() {
    vim_file=".vimrc"
    indexer_file=".indexer_files"
    vim_dir=".vim"
    snips_dir="${vim_dir}/UltiSnips"
    ln -s ${file_path}/vimrc ${vim_file}
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    sed -i 's/^colorscheme/\"colorscheme/g' ${file_path}/vimrc
    vim +PlugInstall +qall
    sed -i 's/^\"colorscheme/colorscheme/g' ${file_path}/vimrc
    touch ${file_path}/indexer_files
    ln -s ${file_path}/indexer_files ${indexer_file}
    mkdir ${file_path}/UltiSnips
    ln -s ../${file_path}/UltiSnips ${snips_dir}
    echo "set vim: ${vim_file} ${vim_dir}/"
}

set_tmux() {
    tmux_file=".tmux.conf"
    ln -s ${file_path}/tmux.conf ${tmux_file}
    echo "set tmux: ${tmux_file}"
}

#
# main process
#
read -p "Initialize setting files(y/n): " confirm
if ! [ "${confirm}" == "y" ]; then
    exit
fi

file_path=
get_relative_path
os_name=$(uname -s)
cd ${HOME}
set_os_settings
set_vim
set_tmux
