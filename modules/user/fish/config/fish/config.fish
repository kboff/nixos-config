if status is-interactive
# Commands to run in interactive sessions can go here
set fish_greeting
set -gx EDITOR nvim
set -gx VISUAL moor
abbr -a y yazi
abbr -a n nvim
abbr -a f fzf-open
abbr -a yt yt-dlp -f bestvideo[height<=2160]+bestaudio --merge-output-format mp4
abbr -a cf 'set -l dir (fd --type d | fzf); and cd $dir'
abbr -a ar systemctl --user restart pipewire pipewire-pulse wireplumber
function ya
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi --cwd-file=$tmp
    set cwd (cat $tmp)
    if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]
        cd $cwd
    end
    rm -f $tmp
end
end

starship init fish | source
function proxy_on
    # 设置 HTTP/HTTPS 代理（同时设置大小写，兼容更多软件）
    set -gx http_proxy "http://127.0.0.1:7890"
    set -gx HTTP_PROXY "http://127.0.0.1:7890"
    set -gx https_proxy "http://127.0.0.1:7890"
    set -gx HTTPS_PROXY "http://127.0.0.1:7890"
    # (可选) 如果你还想让 git 等走 SOCKS5，把下一行注释去掉
    # set -gx all_proxy "socks5://127.0.0.1:7890"
    echo "✅ Proxy is ON (127.0.0.1:7890)"
end

function proxy_off
    # 擦除（取消设置）这些环境变量
    set -ge http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
    echo "❌ Proxy is OFF (Direct connection)"
end
function proxy_status
    echo "http_proxy  : $http_proxy"
    echo "https_proxy : $https_proxy"
end

zoxide init fish | source
