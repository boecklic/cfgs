#!/bin/bash

# find directory of this script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

. ${DIR}/helpers

graceful_ln ${DIR}/bash_aliases 	~/.bash_aliases
graceful_ln ${DIR}/vimrc 			~/.vimrc
graceful_ln ${DIR}/profile          ~/.profile
graceful_ln ${DIR}/bash_env         ~/.bash_env
graceful_ln ${DIR}/tmux.conf        ~/.tmux.conf
