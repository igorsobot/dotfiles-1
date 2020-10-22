# reset
unalias -m "*"

# function paths
fpath=(~/.zsh "$HOME/.zsh/pure" $fpath)

# git completions
# https://github.com/git/git/tree/master/contrib/completion
# 
# If you run into ZSH complaining about insecure directories it will be
# because of files being generated by other groups that are not you or root.
# So ZSH must be told about what to do with these files since they are foreign.
# You can run `compaudit` to list the insecure directores and if `ls` those
# directories, they'll show a writable permission while being apart of an
# insecure group.
#
# Running this command will flip the group-writable permission on those directories:
#
#   chmod g-w /usr/local/share/zsh
#   chmod g-w /usr/local/share/zsh/site-functions
#
# Or more succinctly if there way more directories:
#
#   compaudit | xargs chmod g-w 
#
# This should take care of the warning every time a new ZSH shell is started.
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# prompt
# https://github.com/sindresorhus/pure
autoload -Uz promptinit && promptinit
prompt pure

# blocksize
export BLOCKSIZE=1k

# fs
alias ls="\ls -G"
alias ll="\ls -Gl"
alias la="\ls -Gla"
alias ..="\cd .."
alias ...="\cd ../.."
alias ....="\cd ../../.."
alias df='\df -hT'
alias du='\du -h'

# grep
alias g="\grep -n"
alias grep="\grep -n"
export GREP_OPTIONS="--color=auto"

# network
alias myip="curl ifconfig.co/json"
alias p="ping"
alias n="nslookup"
alias d="dig"
alias ssh="\ssh -v"
alias netcons='lsof -i'
alias openports='sudo lsof -i | grep LISTEN'

# shortcuts
alias c="clear"

# tldr
function tldr {
    curl cheat.sh/"$1"
}

# wttr
function wttr {
    curl wttr.in/"$1"
}

# go
# https://golang.org/
export GOPATH="$HOME/go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# volta
# https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
