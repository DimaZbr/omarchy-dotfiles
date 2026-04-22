function bak --description 'Создает копию файла с расширением .bak'
    if test (count $argv) -gt 0
        set -l file $argv[1]
        if test -e $file
            cp -iv $file $file.bak
        else
            echo "Ошибка: Файл '$file' не найден."
        end
    else
        echo "Использование: bak <filename>"
    end
end
