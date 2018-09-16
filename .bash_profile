source ~/.profile

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(rbenv init -)"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[$(tput bold)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]>>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \$(git_branch) \\$ "

alias be='bundle exec'
alias bbwebcms='kubectl get pods --namespace=broadband --watch | grep broadband-web-cms'
alias bbwebstaging='kubectl get pods --namespace=broadband --watch | grep broadband-web-staging'
alias bbwebprod='kubectl get pods --namespace=broadband --watch | grep broadband-web-produc'


# uSwitch auth
alias authme='u sts auth && u kauth && u vault auth'
