#!/usr/bin/zsh
# vim: foldmethod=marker

# DON'T TOUCH {{{1
# LICENCE NOTICE {{{2
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#  ____  _           _     _       ____             _    _      #
# / ___|| |__   __ _| |__ (_)_ __ / ___|  ___  _ __| | _| |__   #
# \___ \| '_ \ / _` | '_ \| | '_ \\___ \ / _ \| '__| |/ / '_ \  #
#  ___) | | | | (_| | | | | | | | |___) | (_) | |  |   <| | | | #
# |____/|_| |_|\__,_|_| |_|_|_| |_|____/ \___/|_|  |_|\_\_| |_| #
#                                                               #
# <sorkh.shahin@hotmail.com> [MIT (c)] <https://shahinsorkh.ir> #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# LICENCE NOTICE }}}

# DEV USAGE {{{2
#/----------------------------------------------------------------------------\#
#|                                                                            |#
#| Use `exe` to run commands of any kind.                                     |#
#| Use `err <ERROR_CODE> <ERROR_MSG>` to output errors.                       |#
#| Remember to update usage method and explain any error code you may return. |#
#| You may get inputs using options and/or arguments.                         |#
#| Keep usage information up-to-date and respect user's `quiet` mode.         |#
#| Keep usage output lines at a maximum of 80 characters long.                |#
#|                                                                            |#
#\----------------------------------------------------------------------------/#
# DEV USAGE }}}

# PREPARATION {{{2
#| DON'T TOUCH THIS SECTION.                                                  |#
CMD="$0"

# COLOR METHODS {{{3
red () {
    [ -z "$NO_COLOR" ] && echo $'\e[38;5;160m'"$*"$'\e[00m' || echo "$*"
}

cyan () {
    [ -z "$NO_COLOR" ] && echo $'\e[36;1;160m'"$*"$'\e[00m' || echo "$*"
}
# COLOR METHODS }}}

# EXECUTABLE METHODS {{{3
exe () {
    if [ -n "$DRY_RUN" ]; then
        echo $(red '>>') $*
    else
        [ -z "$QUIET" ] && [ -n "$VERBOSE" ] && echo $(red '>') $(cyan $*)
        if [ -z "$QUIET" ]; then
            ( exec $* )
        else
            ( exec $* 2>/dev/null >/dev/null )
        fi
    fi
}

err () {
    ERROR_CODE="$1"
    shift
    ERROR_MSG="$*"

    if [ -z "$QUIET" ]; then
        echo -n $(red '[ERR]') >&2
        echo " $ERROR_MSG" >&2
        [ "$ERROR_CODE" -eq "1" ] && echo "\nRun \`$CMD -h\` for usage" >&2
    fi
    exit $ERROR_CODE
}
# EXECUTABLE METHODS }}}

unset DRY_RUN QUIET NO_COLOR VERBOSE
# PREPARATION }}}
# DON'T TOUCH }}}

#| START FROM HERE.                                                           |#

# USAGE {{{1
usage () {
    echo -n "USAGE: $CMD"
    #echo -n "#############"
    echo -n " [-h | --help]"    # DON'T TOUCH
    echo -n " [-n | --dry]"     # DON'T TOUCH
    echo -n " [-q | --quiet]"   # DON'T TOUCH
    echo -n " [--no-color]"     # DON'T TOUCH
    echo -n " [-v | --verbose]" # DON'T TOUCH
    echo "\n"
    #echo "\t""#######################"
    echo "\t""-h, --help    :       Shows this help message"                            # DON'T TOUCH
    echo "\t""-n, --dry     :       Doesn't do anything just shows you what commands"   # DON'T TOUCH
    echo "\t""                      would be executed"                                  # DON'T TOUCH
    echo "\t""-q, --quiet   :       Turns off output"                                   # DON'T TOUCH
    echo "\t""--no-color    :       Turns off colorized output (off by default if not"  # DON'T TOUCH
    echo "\t""                      a tty or terminal doesn't support)"                 # DON'T TOUCH
    echo "\t""-v, --verbose :       Verbose output (not applicable if running with -q)" # DON'T TOUCH
    echo
    echo "EXIT STATUS:"
    echo "\t""0             SUCCESS"        # DON'T TOUCH
    echo "\t""1             INVALID OPTION" # DON'T TOUCH
    #echo "\t""#             ############"
    echo "\t""200           UNKNOWN ERROR"  # DON'T TOUCH
    exit ${1:-0}
}
# USAGE }}}

# COLLECTING OPTIONS AND ARGS {{{1
#| Turn off colors if not a tty or if terminal doesn't support colors.        |#
[ -z "$NO_COLOR" ] && ( [ ! -t 1 ] || [ -z "$(tput colors)" ] ) && NO_COLOR=1   # DON'T TOUCH

for opt in ${@}; do
    case "$opt" in
        #####) ####### ;;
        -h|--help) usage ;;                 # DON'T OVERRIDE
        -n|--dry) DRY_RUN=1 ;;              # DON'T OVERRIDE
        -q|--quiet) QUIET=1 ;;              # DON'T OVERRIDE
        --no-color) NO_COLOR=1 ;;           # DON'T OVERRIDE
        -v|--verbose) VERBOSE=1 ;;          # DON'T OVERRIDE
        *) err 1 Invalid option: $opt ;;    # DON'T TOUCH
    esac
done
# COLLECTING OPTIONS AND ARGS }}}

####################
####################
####################

[ "$?" -ne "0" ] && exit 200 || exit 0      # DON'T TOUCH
