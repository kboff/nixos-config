function zx
    set -l query (string join ' ' $argv)
    set -l dir

    set dir (zoxide query --list --score | \
        fzf --filter="$query" --no-sort | \
        fzf \
            --prompt="zoxide > " \
            --nth=2.. \
            --ansi \
            --height=60% \
            --info=inline \
            --border=rounded \
            --layout=reverse \
            --preview-window=down:40%:wrap \
            --preview='ls -F -C --color=always {2..}' \
            --bind 'ctrl-z:ignore,btab:up,tab:down,enter:become:echo {2..}' \
            --cycle \
            --keep-right \
            --tabstop=1
    )

    if test -n "$dir"
        cd $dir
    end
end
