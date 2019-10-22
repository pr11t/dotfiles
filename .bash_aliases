alias halp='less ~/.bash_aliases'
alias p='ping'
alias s='ssh'
alias g='grep'
alias h='history'
alias tailf='tail -f'
alias hs='history | grep'
alias duh='du -hs * | sort -h'

# Python virtualenv management
alias lsenv='_envman ls'
alias chenv='_envman chenv'
alias mkenv='_envman mkenv'
function _envman() {
venvpath="/home/priit/.virtualenvs"
case $1 in
	ls)
	ls $venvpath
	;;
	chenv)
	source "$venvpath/$2/bin/activate"
	;;
	mkenv)
	virtualenv -p python3 "$venvpath/$2"
	_envman chenv "$2"
	;;
esac
}

# Create a ssh tunnel proxying a port to localhost:2000
alias ssh2k='_ssh2k'
function _ssh2k() {
ssh root@"$1" -L 2000:127.0.0.1:"$2" -N
}

# Start webserver in current dir
alias serve='python -m SimpleHTTPServer 8000'

# Run an interactive Ubuntu docker container
alias dubuntu='docker run -it --rm ubuntu bash'
