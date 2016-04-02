diffdb()
{
  cleartool diff -g /ccdevelop/ecbdb/sql/fits_mainDB/procs/$1 /ccdevelop/getsdb/sql/fits_mainDB/procs/$1
}
settitle()
{
    [ "$TERM" != "xterm" -a "$TERM" != "dtterm" -a $TERM != "vt100" ] && return
    [ -o interactive ] && print "]0;${1}\007"
}


_setprompt ()
{

    dir="${PWD#$HOME}"
    if [ "" = "$dir" ]
    then
	dir="~${LOGNAME}"
    elif [ "x.$dir" != "x.$PWD" ]
    then
	dir="~${dir}"
    fi
    MS=`/bin/uname -n`
  
    export PS1="<$MS>:${dir}
\$${OBOLD} "
}

_setprompt

_cd()
{
    \cd "$@"
    _setprompt
}

alias cd="_cd"

#
# Csh compatability:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -le $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

dedupPath()
{
	/usr/bin/awk -F: '{pp="";for(i=1;i<=NF;i++){if(p[$i]==0){p[$i]=1;q=q FS $i}}print substr(q,2,length(q)-1)}'
}

findLib()
{
	for i in `echo $LD_LIBRARY_PATH |tr ':' ' ' `
	do
			find $i |grep $1
	done
}

lmake()
{
	date >> make.log
	echo "============================" >> make.log 
	touch .make.start 
	gmake |tee -a make.log 
}


