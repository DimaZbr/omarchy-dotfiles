set -g fish_greeting ""

# fastfetch -c small.jsonc

function fish_prompt
    #set_color normal
    echo -n (prompt_pwd) # Текущий путь (сокращенный, например ~/D/work)
    set_color green
    echo -n " ⬤ "
    #set_color normal
end

function cheat --description 'Показать шпаргалку команд'
    echo (set_color --bold blue)"─── АББРЕВИАТУРЫ ───"(set_color normal)
    abbr --show
    echo ""
    echo (set_color --bold green)"─── АЛИАСЫ ───"(set_color normal)
    alias
    echo ""
    echo (set_color --bold yellow)"─── МОИ ФУНКЦИИ ───"(set_color normal)
    functions -n | grep -v '^_ ' # Показывает все функции, кроме системных
end

if status is-interactive

    alias gl='gsettings set org.gnome.desktop.interface color-scheme 'prefer-light''
    alias gd='gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark''
    # Commands to run in interactive sessions can go here
    alias ls='eza -lha --icons=auto --sort=name --group-directories-first'
    alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
    alias zd='zeditor'
    alias op='opencode'
    alias gm='gemini'
    alias wf='iw dev wlan0 link'
    alias active='sleep 2; cat /proc/$(hyprctl activewindow -j | jq -r '.pid')/comm'

    # Directories
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias fas='fastfetch -c small.jsonc'
    # Tools
    alias c='opencode'
    alias d='docker'
    alias r='rails'

    # Git
    alias g='git'
    alias gcm='git commit -m'
    alias gcam='git commit -a -m'
    alias gcad='git commit -a --amend'
    alias ws='warp-cli status'
    alias w1='warp-cli connect && warp-cli status'
    alias w0='warp-cli disconnect && warp-cli status'
end
