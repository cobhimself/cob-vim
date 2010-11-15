# cob-vim

This is my personal vimrc file.

This configuration makes use of [pathogen](http://www.vim.org/scripts/script.php?script_id=2332) to have
a well organized vim directory.

It also heavily uses vim submodules where possible for all plugins. This makes for easy updating.

It also works well on Windows, Linux and OSX without even modifying directories. Just clone and run.

## The vimrc file

The structure of this vimrc file is based heavily on spf13's [vimrc](http://github.com/spf13/).

It fixes many of the inconveniences of vanilla vim including

## Installation

    git clone git://github.com/cobhimself/cob-vim.git
    cd cob-vim
    git submodule update --init

I use symlinks that point to the .vimrc and .vim folder so the repository can be placed anywhere.

Use ln -s on mac/unix or mklink on windows.

    cd ~
    ln -s /path/to/cob-vim/vimrc .vimrc
    ln -s /path/to/cob-vim/vim .vim
