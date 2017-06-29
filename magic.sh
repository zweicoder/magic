#!/usr/bin/env bash

set -euo pipefail

if ([ $# == 0 ] || [ $1 == 'help' ]); then
    echo 'Usage: magic [ help | new ] <task-name>'
    exit 1
fi

if [ $1 == 'new' ]; then
    if [ $# -ne 2 ]; then
        echo 'Usage: magic new <task-name>'
        exit 1
    fi

    if [ ! -d .magic ]; then
        mkdir .magic
    fi

    if [ -f ".magic/$2" ]; then
        echo ".magic/$2 already exists"
        exit 1
    fi

    echo '#!/usr/bin/env bash' > .magic/$2
    chmod +x .magic/$2
    echo "Created file at .magic/$2"
else
    SCRIPT=$1
    if [ ! -d .magic ]; then
        echo '.magic/ not found in current directory'
        exit 1
    fi

    if [ -f .magic/$SCRIPT ]; then
        .magic/$SCRIPT "${@:2}"
    elif [ -f .magic/$SCRIPT.sh ]; then
        .magic/$SCRIPT.sh "${@:2}"
    else
        echo '.magic/$SCRIPT or .magic/$SCRIPT.sh not found!'
        exit 1
    fi
fi

