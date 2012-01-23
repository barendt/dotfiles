. ~/bin/bash_colors.sh

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# Setting PATH for EPD
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/local/git/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

# Use Textmate if it is installed
if [ -d /Applications/TextMate2.app ]; then
	export EDITOR="$HOME/bin/mate -w"
	export GIT_EDITOR="$HOME/bin/mate -w"
	export SVN_EDITOR="$HOME/bin/mate -w"
	export VISUAL="$HOME/bin/mate -w"
else
	export VISUAL="emacs"
	export SVN_EDITOR="emacs"
	export EDITOR="emacs"
fi

# Got the next bit from https://github.com/garybernhardt/dotfiles/blob/master/.bashrc
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
barendt_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="$(minutes_since_last_commit)m"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s)"`
        echo ${GIT_PROMPT}
    fi
}
PS1="\h:\W\$(barendt_git_prompt) \u\$ "
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
alias pygrep="grep --include='*.py' $*"
source ~/bin/git-completion.bash

function wigrep() {
    find . -name \*.inc -print0 | xargs -0 grep "$1"
}
