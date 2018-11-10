alias vi="vim"
alias ll="exa --long --git -a"
alias ls="exa"
alias preview="fzf --preview 'bat --color \"always\" {}'"

export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vi {})+abort'"
