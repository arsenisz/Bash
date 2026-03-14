#!/bin/bash

# Перевірка наявності параметрів
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Використання: $0 <директорія1> <директорія2>"
    echo "Приклад: $0 /home /var/log"
    exit 1
fi

# Функція виводу топ 10 по розміру
show_top10() {
    local DIR="$1"
    echo "=============================="
    echo "Топ 10 у директорії: $DIR"
    echo "=============================="
    du -ab "$DIR" 2>/dev/null | sort -rn | head -10 | awk '{printf "%10d байт  %s\n", $1, $2}'
    echo ""
}

show_top10 "$1"
show_top10 "$2"
