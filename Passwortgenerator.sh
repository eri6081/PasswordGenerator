#!/bin/bash

function EingabeNutzer {
    echo "Bitte wähle eine Option:
          1) Einfaches Passwort generieren
          2) Komplexes Passwort generieren"
    read -p "Auswahl: " userinput

    if [ $userinput -eq 1 ]; then
        EinfachesPasswort
    elif [ $userinput -eq 2 ]; then
        KomplexesPasswort
    else
        echo "Ungültige Auswahl"
    fi
}

function EinfachesPasswort {
    local word_file="words.txt"
    local words=()

    while IFS= read -r line; do
        words+=("$line")
    done < "$word_file"

    local words=${words[$((RANDOM % ${#words[@]}))]}

    local numbers=$(( RANDOM % 90 + 10 ))

    local password="${numbers}${words}"
    echo "Einfaches Passwort: $password"
}

function KomplexesPasswort {
    password=$(head /dev/urandom | tr -dc 'A-Za-z0-9@#$%^&*' | head -c 20)
    echo "Komplexes Passwort: $password"
}

EingabeNutzer
