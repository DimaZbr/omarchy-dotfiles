function helpme --description 'Поиск по алиасам, функциям и аббревиатурам'
    # Собираем всё в один список
    set -l list (alias; abbr --show; functions -n)

    # Запускаем fzf для поиска
    printf "%s\n" $list | fzf --header "Мои команды и сокращения:" --height 40% --layout reverse
end
