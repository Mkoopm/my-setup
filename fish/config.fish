# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Applications/Anaconda3/anaconda3/bin/conda
    eval /Applications/Anaconda3/anaconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

set LSCOLORS exfxcxdxbxegedabagacad

set -gx PYENV_ROOT "$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2023-12-18 10:49:39
export PATH="/Users/mk/.local/bin:$PATH"

alias gs='git status'
alias gaa='git add *'
alias gl="git log --graph --oneline --decorate --all"

export EDITOR=nano
export VISUAL=nvim

zoxide init fish | source

fish_add_path "HOME/.bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/mk/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
