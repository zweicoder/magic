upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
        test -e "$directory/$1" && echo "$directory/$1" && return
        directory="$directory/.."
    done
}
_GetComps () {
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}

    DIR=`./upsearch .magic`
    choices=''
    if [ $DIR ]; then
        choices=`ls $DIR`
    fi

    COMPREPLY=( $( compgen -W "$choices" -- $cur ) )
    return 0
}

complete -F _GetComps -o filenames ./magic.sh
