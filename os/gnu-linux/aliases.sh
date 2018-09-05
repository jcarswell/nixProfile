alias vi="vim"
alias ll="exa --long --git"
alias ls="ls --color"
alias preview="fzf --preview 'bat --color \"always\" {}'"

export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vi {})+abort'"
