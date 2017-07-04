#!/usr/bin/env bash

set -euo pipefail

upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
        test -e "$directory/$1" && echo "$directory/$1" && return
        directory="$directory/.."
    done
}

if ([ $# == 0 ] || [ $1 == 'help' ]); then
    echo 'Usage: magic [ help | new ] <task-name>'
    exit 1
fi

DIR=`./upsearch .magic`

if [ $1 == 'new' ]; then
    if [ $# -ne 2 ]; then
        echo 'Usage: magic new <task-name>'
        exit 1
    fi

    if [ ! -d .magic ]; then
        mkdir .magic
    fi

    if [ -f "$DIR/$2" ]; then
        echo "$DIR/$2 already exists"
        exit 1
    fi

    echo '#!/usr/bin/env bash' > $DIR/$2
    chmod +x $DIR/$2
    echo "Created file at $DIR/$2"
else
    SCRIPT=$1
    if [ -z $DIR ]; then
        echo '.magic/ not found in current or any parent directory'
        exit 1
    fi

    if [ -f $DIR/$SCRIPT ]; then
        $DIR/$SCRIPT "${@:2}"
    elif [ -f $DIR/$SCRIPT.sh ]; then
        $DIR/$SCRIPT.sh "${@:2}"
    else
        echo "$SCRIPT  or $SCRIPT.sh not found in $DIR"
        exit 1
    fi
fi

