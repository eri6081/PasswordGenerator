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
    words=("Apfel" "Banane" "Kirsche" "Orange" "Erdbeere" "Himbeere" "Blaubeere")
    password="${words[$((RANDOM % ${#words[@]}))]}$((RANDOM%9000+1000))"
    echo "Einfaches Passwort: $password"
}

function KomplexesPasswort {
    password=$(head /dev/urandom | tr -dc 'A-Za-z0-9@#$%^&*' | head -c 20)
    echo "Komplexes Passwort: $password"
}

EingabeNutzer
