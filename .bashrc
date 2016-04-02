# Bourne Again SHell init file.

export OS=`uname -r | sed -e 's/\([0-9]*\).*/\1/'`

if [ $OS == '4' ];  then
    export OSTYPE=sunos
else
    export OSTYPE=solaris
fi

umask 002

export SHELL=bash

# Don't make useless coredump files.  If you want a coredump,
# say "ulimit -c unlimited" and then cause a segmentation fault.

ulimit -c 0

# If not running interactively, then return
if [ -z "$PS1" ]; then
	return
fi

auto_resume=exact

# Set notify if you want to be asynchronously notified about background
# job completion.
set -o notify

# Make it so that failed `exec' commands don't flush this shell.
shopt -s execfail

if [ -z "$LOGIN_SHELL" ]; then
	PS1="\u@\h\$ "
fi
[ -f ~/.bash_siteconfig ] && . ~/.bash_siteconfig
[ -f ~/.bash_functions ] && . ~/.bash_functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Truncate path variables

PATH=`echo $PATH| dedupPath`
LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH |dedupPath`
CLASSPATH=`echo $CLASSPATH|dedupPath`

