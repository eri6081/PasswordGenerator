#!/bin/bash

function EingabeNutzer 
{
    echo "Gebe bitte deine Auswahl an:
          1) einfaches Passwort generieren
          2) komplexes Passwort generieren
          3) horse-staple Passwort generieren"
    read -p "Auswahl: " Userinput 

    case "$Userinput" in
        1)
            EinfachesPasswort
            ;;
        2)
            KomplexesPasswort
            ;;
        3)
            HorseStaple
            ;;
        *)
            echo "Ungültige Auswahl. Bitte wähle 1, 2 oder 3."
            ;;
    esac
}

function EinfachesPasswort 
{
    password=$(shuf -n2 words.txt | tr '\n' ' '; echo $((RANDOM%9000+1000)))
    echo "Einfaches Passwort: $password"
}

function KomplexesPasswort 
{
    password=$(head /dev/urandom | tr -dc 'A-Za-z0-9@#$%^&*' | head -c 20)
    echo "Komplexes Passwort: $password"
}

function HorseStaple 
{
    password=$(shuf -n4 words.txt | tr '\n' ' ')
    echo "Horse-staple Passwort: $password"
}

if [ ! -f words.txt ]; then
    echo "words.txt nicht gefunden. Bitte stelle sicher, dass die Datei im gleichen Verzeichnis wie dieses Skript vorhanden ist."
    exit 1
fi

EingabeNutzer
