#!/bin/bash

# find directory of this script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

. ${DIR}/helpers.sh
. ${DIR}/bashcolor

graceful_ln ${DIR}/bash_aliases 	~/.bash_aliases
graceful_ln ${DIR}/vimrc 			~/.vimrc
graceful_ln ${DIR}/profile          ~/.profile
graceful_ln ${DIR}/bash_env         ~/.bash_env

# slightly more logic needed for git-completion since dependant on git version
GIT_VERSION=`git version | grep -oE "[0-9]*\.[0-9]*\.[0-9]*"`
echo "current git version: $GIT_VERSION"
if [ ! \( -e "${DIR}/git/git-completion/$GIT_VERSION/git-completion.bash" \) ]; then
    echo "git-completion.bash doesn't exist for installed git version $GIT_VERSION"
    echo "install first with "
    echo "curl -fLo ${DIR}/git/git-completion/$GIT_VERSION/git-completion.bash --create-dirs https://github.com/git/git/blob/v$GIT_VERSION/contrib/completion/git-completion.bash"
    exit 1
fi
graceful_ln ${DIR}/git/git-completion/$GIT_VERSION/git-completion.bash        ~/.git-completion.bash

# setup vim
#----------
# setup vim-plug, the simple plugin manager for vim, for more details
# check ~/.vimrc
if [ ! \( -e "${HOME}/.vim/autoload/plug.vim" \) ]; then
    echo "installing vim plugin manager"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# setup tmux
#-----------
graceful_ln ${DIR}/tmux.conf   ~/.tmux.conf
graceful_ln ${DIR}/tmux        ~/.tmux


# setup tmux plugin manager
# check ~/.tmux.conf
if [ ! \( -e "${HOME}/.tmux/plugins/tpm" \) ]; then
    echo "installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager already installed, skipping"
fi
