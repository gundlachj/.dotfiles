autoload -U colors && colors
export PS1="%{$fg[green]%}[%{$fg[blue]%}%n%{$fg[red]%}@%{$fg[magenta]%}%1~%{$fg[green]%}]%{$reset_color%} "

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi
