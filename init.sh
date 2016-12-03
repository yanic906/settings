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
    if [ "${os_name}" == "Darwin" ]; then
        echo "Use OS X"
        bash_file=".bash_profile"
    elif [ "${os_name}" == "Linux" ]; then
        echo "Use Ubuntu"
        bash_file=".bash_aliases"
    else
        echo "error: Not Ubuntu or MAC"
        exit
    fi
    ln -s ${file_path}/bash_settings ${bash_file}
    echo "set bash: ${bash_file}"
}

set_vim() {
    vim_file=".vimrc"
    vim_dir=".vim"
    ln -s ${file_path}/vimrc ${vim_file}
    mkdir -p ${vim_dir}/bundle
    git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
    vim +PluginInstall +qall
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
