RESET="\[\017\]"
BASE="\[\033[0m\]"
RED="\[\033[31m\]"
YELLOW="\[\033[33m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
LIGHTBLUE="\[\033[36m\]"
SMILEY="${GREEN}:)${BASE}"
FROWNY="${RED}:(${BASE}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

#disable python virtual environment prompt overwrite
export VIRTUAL_ENV_DISABLE_PROMPT=1


shopt -s histappend
__shell_ps1() {
    #preserve exit code
    local exit=$?
    local gitstring=$(__git_ps1)

    PS1="╭─${BLUE}[${LIGHTBLUE} \w ${BLUE}]${BASE}─${BLUE}[${YELLOW}\u${BLUE}@${RED}\h${BLUE}]${BASE}─${BLUE}[\`${SELECT}\`${BLUE}]${BASE}\n╰─${BLUE}["

    if [ -n "${gitstring}" ]; then
        if [ -n "${VIRTUAL_ENV}" ]; then
            PS1+="${RED}\$(basename ${VIRTUAL_ENV})${BASE}|${LIGHTBLUE}${gitstring}${BASE}"
        else
            PS1+="${LIGHTBLUE}${gitstring}${BASE}"
        fi
    elif [ -n "${VIRTUAL_ENV}" ]; then
        PS1+="${RED}\$(basename ${VIRTUAL_ENV})${BASE}"
    fi

    PS1+="${BLUE}] ${YELLOW}>${RESET}${BASE} "

    history -a
    history -c
    history -r

    return $exit
}

PROMPT_COMMAND=__shell_ps1
#export PS1="╭─${BLUE}[${LIGHTBLUE} \w ${BLUE}]${BASE}─${BLUE}[${YELLOW}\u${BLUE}@${RED}\h${BLUE}]${BASE}─${BLUE}[\`${SELECT}\`${BLUE}]${BASE}\n╰─${BLUE}(\$(__env_ps1) ${BLUE}) ${YELLOW}>${RESET}${BASE} "
