RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31m\]"
YELLOW="\[\033[33m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
LIGHTBLUE="\[\033[36m\]"
SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"


export PS1="╭─${BLUE}[${LIGHTBLUE} \w ${BLUE}]${NORMAL}─${BLUE}[${YELLOW}\u${BLUE}@${RED}\h${BLUE}]${NORMAL}─${BLUE}[\`${SELECT}\`${BLUE}]${NORMAL}\n╰─${BLUE}[${LIGHTBLUE}\$(__git_ps1) ${BLUE}] ${YELLOW}>${RESET}${NORMAL} "
