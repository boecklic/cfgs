#!/bin/bash
# This is ~/.bash_aliases

# find directory of this script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

# colorful
. ${DIR}/bashcolor

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
   
    # use same shortcut to copy to clipboard as on OSX
	alias pbcopy='xclip -selection c'
    echo -e "setting alias $(white 'pbcopy') to $(lightgrey 'xclip -selection c')"

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "no additional aliases for OSX"
 
fi

# Generic for any platform
alias gst='git status'
echo -e "setting alias $(white 'gst') to $(lightgrey 'git status')"

# some more ls aliases
alias ll='ls -lF'
echo -e "setting alias $(white 'll') to $(lightgrey 'ls -lF')"
alias la='ls -la'
echo -e "setting alias $(white 'la') to $(lightgrey 'ls -la')"

alias bc='bc -l'
echo -e "setting alias $(white 'bc') to $(lightgrey 'bc -l') (preload math library and set scale to 20)"

alias screen='screen -R -D'
echo -e "setting alias $(white 'screen') to $(lightgrey 'screen -D -R') (D)etach and (R)eattach a session here and now (detach if necessary, create if necessary)"

alias tmx='tmux -a -d 0'
echo -e "setting alias $(white 'tmx') to $(lightgrey 'tmux -a -d 0') reattach to session 0 "
