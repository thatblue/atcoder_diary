#!/usr/bin/bash

if [ $# -eq 0 ]; then
    echo "usage: $@ <contest-id> [<problems:abcdefgh>]"
    exit 1
fi

CONTEST=`echo $1 | tr [:upper:] [:lower:]`

if [ $# -eq 1 ]; then
    PROBLEMS=abcde
fi

if [ $# -eq 2 ]; then
    PROBLEMS=$2
fi

echo $PROBLEMS | fold -w 1 | while read p; do
    echo -e "generate: ${CONTEST}_${p}.rb"
    touch "${CONTEST}_${p}.rb"
done

exit 0
