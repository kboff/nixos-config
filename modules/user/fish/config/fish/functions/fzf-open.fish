function fzf-open
    set -l sel (
        fd -H -t f -t d |
        fzf \
            --height=90% \
            --layout=reverse \
            --border \
            --preview='__fzf_preview {}' \
            --preview-window=right:55%
    )

    test -z "$sel"; and return

    if test -d "$sel"
        cd "$sel"
        return
    end

    set -l ext (string lower (path extension "$sel"))
    set -l mime (file --mime-type -b "$sel")

    switch $ext
        case ".md" ".markdown" ".txt" ".conf" ".ini" ".lua" ".py" ".c" ".cpp" ".h" ".hpp" ".json" ".yaml" ".yml" ".toml" ".fish" ".sh"
            nvim "$sel"
            return
    end

    switch $mime
        case "text/*"
            nvim "$sel"
        case "*"
            xdg-open "$sel" >/dev/null 2>&1 &
    end
end
