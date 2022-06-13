#!/usr/bin/env bash
# shellcheck disable=SC2016

# A simple script for fun w/wflows
# <wflows> : production webhook flows

OPTIONS=$1

if [ -z "${OPTIONS}" ];
then
    printf 'Following are flags:\n'
    printf '    -weather : current weather\n'
    printf '    -nbak : backup your workflows\n'
fi

if [ "${OPTIONS}" = "-weather" ];
then
    echo -e "$(curl -sL -X GET -G "https://<wflows>/weather" -H "User-Agent: curl/7.64.0")"
fi

if [ "${OPTIONS}" = "-nbak" ];
then
    echo -e "$(curl -sL -X GET -G "https://<wflows>/webhook" -H "User-Agent: curl/7.64.0")"
fi
