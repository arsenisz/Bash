#!/bin/bash

if [ -z "$1" ]; then
    echo "Використання: $0 <розширення>"
    echo "Приклад: $0 txt"
    exit 1
fi

FORMAT="$1"
SOURCE_DIR="$(pwd)"
DEST_DIR="/tmp/newdir"

mkdir -p "$DEST_DIR"

COUNT=0
for file in "$SOURCE_DIR"/*."$FORMAT"; do
    if [ -f "$file" ]; then
        cp "$file" "$DEST_DIR"
        echo "Скопійовано: $(basename "$file")"
        ((COUNT++))
    fi
done

if [ "$COUNT" -eq 0 ]; then
    echo "Файли з розширенням .$FORMAT не знайдені"
else
    echo "Готово! Скопійовано файлів: $COUNT → $DEST_DIR"
fi

