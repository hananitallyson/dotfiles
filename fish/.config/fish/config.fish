function fish_prompt
    set -l last_status $status

    set_color '#6e6e6e'
    printf '%s@%s ' $USER $hostname
    set_color '#a5a5a5'
    printf '%s' (prompt_pwd)

    if command -sq git
        set -l branch (git branch --show-current 2>/dev/null)
        if test -n "$branch"
            set_color '#6e6e6e'
            printf ' (%s)' $branch
        end
    end

    if test $last_status -ne 0
        set_color '#4a4a4a'
    else
        set_color '#f5f5f5'
    end
    printf '$ '
    set_color normal
end

set -q ASDF_DATA_DIR; or set -gx ASDF_DATA_DIR "$HOME/.asdf"

if not contains "$ASDF_DATA_DIR/shims" $PATH
    set -gx PATH "$ASDF_DATA_DIR/shims" $PATH
end

set --erase _asdf_shims

set -g fish_greeting

type -q fastfetch; and fastfetch

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="ls --color=auto"
