# set iterm to color mode
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

gitup () { 
    (cd ~/repos ; for r in *; do echo -n -e "\nUpdating repo: $r... "; 
     (cd $r; git pull); 
     done);
}

alias st='git status'
alias gdiff='git diff'
alias "branches"='CUR_DIR=`pwd`; for dir in ~/repos/*/; do echo $dir; cd $dir; git br; cd ..; done; cd $CUR_DIR'
alias "sts"='for dir in ~/repos/*/; do echo $dir; cd $dir; st; cd ..; done'
git_retag () {
    tag=$1
    commit=$2
    msg=$3
    if [ -z $tag ] || [ -z $commit ] || [ -z "$msg" ]; then
        echo "Usage: git_retag [tag] [new commit] [message]"
        return 1
    fi
    git tag -d $tag && git tag -a $tag $commit -m "$msg" && \
        git push --force origin refs/tags/$tag:refs/tags/$tag
}
alias ls='gls --color'
alias ll='ls -l'
alias la='ls -al'
alias python='python3'
alias grep='grep --color'

## Enable nifty auto-completion for git commands and dynamically insert
## current branch into the prompt.
if [[ -f ~/.git-completion.bash && -f ~/.git-prompt.sh ]]; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    export PS1='[\h: \w$(__git_ps1 " (%s)")]\n\u $ '
else
    export PS1='\h:\u \w$ \n'
fi

export HTTPOBS_API_URL=http://192.168.99.100:57001/api/v1
