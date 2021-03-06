# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
clear
screenfetch

PS1='\[\033[38;5;43m\]\u\[\033[38;5;31m\]@\[\033[38;5;43m\]\h\[\033[38;5;31m\]:\[\033[38;5;183m\]\w\[\033[00m\] \[\033[38;5;214m\]$\[\033[0m\] '

# aliases
alias ll="ls -l"
alias la="ls -a"
alias please='sudo $(history -p !!)'
alias vi=vim
alias :q="exit"
alias :wq="exit"
alias cls=clear
alias bashreload="source ~/.bashrc"
alias lip="ip addr | grep inet | grep wlan0"
alias p4='ping 4.2.2.2 -c 4'

sci(){
	if [ $# != 1 ]; then
                crew -h
        else
                crew install $1
        fi
}

csearch(){
	if [ $# != 1 ]; then
                echo "Usage: csearch <search term>"
        else
        	crew search | grep -e "$1"
        fi
}

mkcd() {
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

cl()
{
        last_dir="$(ls -Frt | grep '/$' | tail -n1)"
        if [ -d "$last_dir" ]; then
                cd "$last_dir"
        fi
}

sud() { # do sudo, or sudo the last command if no argument given
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
