if not set -q ASDF_DATA_DIR
    set -gx ASDF_DATA_DIR "$HOME/.asdf"
end

set _asdf_shims "$ASDF_DATA_DIR/shims"

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end

set --erase _asdf_shims

set fish_greeting

set -g fish_history fish

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="ls --color=auto"

function nuke
    clear
    history clear
end

type -q pfetch; and pfetch

