# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# find directory of this script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# include .bash_env if it exists
if [ -f "$HOME/.bash_env" ]; then
    . "$HOME/.bash_env"
fi

# set PATH so it includes user's private bin directories
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi

# inlucde MacPorts bin path (if they exist)
if [ -d "/opt/local/bin" ] ; then
    PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# make a nice prompt when in git repos
# stuff for the git-prompt, check
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# for details
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
source ${DIR}/bin/git-prompt.sh

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND='__git_ps1 "\u@\h:" "\\\$ "'
fi

