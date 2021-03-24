#!/usr/bin/env bash

_iswitch_complete_ncconf()
{
    local cur=${COMP_WORDS[$COMP_CWORD]}

    if [ -d "${HOME}/.irods/iswitch" ] && [ -L "${HOME}/.irods/irods_environment.json" ]
    then
        local CONFIGS=( $( find "${HOME}/.irods/iswitch"  -name "config-*.json" | \
                             sed -E 's:^.*/config-(.*).json$:\1:' | \
                             grep -v "^$(iswitch which)" ) )
        COMPREPLY=($(compgen -W "${CONFIGS[*]}" -- "$cur"))
    else
        COMPREPLY=()
    fi
}

_iswitch_complete_allconf()
{
    local cur=${COMP_WORDS[$COMP_CWORD]}

    if [ -d "${HOME}/.irods/iswitch" ] && [ -L "${HOME}/.irods/irods_environment.json" ]
    then
        local CONFIGS=( $( find "${HOME}/.irods/iswitch" -name "config-*.json" | \
                             sed -E 's:^.*/config-(.*).json$:\1:' ) )
        COMPREPLY=($(compgen -W "${CONFIGS[*]}" -- "$cur"))
    else
        COMPREPLY=()
    fi
}

_iswitch_complete()
{
    local cur=${COMP_WORDS[$COMP_CWORD]}
    local cmd=${COMP_WORDS[1]}
    local cmds="to add mv rm update clone init edit list which"

    if [ "$COMP_CWORD" -eq "1" ]
    then
        COMPREPLY=( $(compgen -W "$cmds" -- "$cur" ))
    elif [ "$COMP_CWORD" -eq "2" ]  && [ "$cmd" = "to" ]
    then
        _iswitch_complete_ncconf
    elif [ "$COMP_CWORD" -eq "2" ]  && [ "$cmd" = "rm" ]
    then
        _iswitch_complete_ncconf
    elif [ "$COMP_CWORD" -eq "3" ]  && [ "$cmd" = "add" ]
    then
        COMPREPLY=( $(compgen -f -- "$cur") )
    elif [ "$COMP_CWORD" -ge "2" ]  && [ "$cmd" = "mv" ]
    then
        _iswitch_complete_ncconf
    elif [ "$COMP_CWORD" -eq "2" ]  && [ "$cmd" = "update" ]
    then
        _iswitch_complete_allconf
    elif [ "$COMP_CWORD" -eq "3" ]  && [ "$cmd" = "update" ]
    then
        COMPREPLY=( $(compgen -f -- "$cur") )
    else
        COMPREPLY=()
    fi
}

complete -o filenames -F _iswitch_complete iswitch
