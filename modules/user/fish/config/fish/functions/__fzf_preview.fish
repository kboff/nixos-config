function __fzf_preview
    set -l file $argv[1]

    test -e "$file"; or exit

    # 目录
    if test -d "$file"
        eza --tree --icons --level=3 "$file"
        return
    end

    set -l ext (string lower (path extension "$file"))
    set -l mime (file --mime-type -b "$file")

    switch $ext

        # ---------- Markdown ----------
        case ".md" ".markdown"
            if type -q glow
                glow -s dark "$file"
            else
                bat --color=always --style=numbers "$file"
            end
            return

        # ---------- PDF ----------
        case ".pdf"
            set -l png "/tmp/fzf-preview-$fish_pid.png"

            pdftoppm -png -singlefile -f 1 -l 1 \
                "$file" "/tmp/fzf-preview-$fish_pid" >/dev/null 2>&1

            if test -f "$png"
                kitty +kitten icat --clear >/dev/null 2>&1
                kitty +kitten icat \
                    --transfer-mode=memory \
                    --place=80x18@0x0 \
                    "$png"
            end

            echo
            echo "──────── PDF Info ────────"
            pdfinfo "$file"
            return
    end

    switch $mime

        # ---------- 图片 ----------
        case "image/*"

            # kitty +kitten icat --clear >/dev/null 2>&1
            #
            # kitty +kitten icat \
            #     --transfer-mode=memory \
            #     --place=80x18@0x0 \
            #     "$file"
            #
            echo
            echo "──────── Metadata ────────"
            mediainfo "$file"
            return

        # ---------- 视频 ----------
        case "video/*"

            # set -l cache ~/.cache/fzf-thumbnail
            # mkdir -p "$cache"
            #
            # set -l thumb "$cache/"(path basename "$file")".jpg"
            #
            # if not test -f "$thumb"
            #     ffmpegthumbnailer \
            #         -i "$file" \
            #         -o "$thumb" \
            #         -s 0 >/dev/null 2>&1
            # end
            #
            # kitty +kitten icat --clear >/dev/null 2>&1
            #
            # if test -f "$thumb"
            #     kitty +kitten icat \
            #         --transfer-mode=memory \
            #         --place=80x18@0x0 \
            #         "$thumb"
            # end
            #
            echo
            echo "──────── Metadata ────────"
            mediainfo "$file"
            return

        # ---------- 音频 ----------
        case "audio/*"
            mediainfo "$file"
            return

        # ---------- 普通文本 ----------
        case "text/*"
            bat \
                --color=always \
                --style=numbers \
                --line-range=:300 \
                "$file"
            return

        # ---------- 默认 ----------
        case "*"
            file "$file"
    end
end
