#!/usr/bin/bash

# Hilfefunktion
usage() {
  echo "Usage: $0 [options]"
  echo "  -w, --words <num>         Number of words for simple password"
  echo "  -n, --numbers <num>       Number of numbers for simple password"
  echo "  -c, --complex <num>       Length of complex password"
  echo "  -hs, --horse-staple <num> Number of words for horse-staple password"
  echo "  -u, --uppercase           Include uppercase letters in complex password"
  echo "  -l, --lowercase           Include lowercase letters in complex password"
  echo "  -s, --special             Include special characters in complex password"
  echo "  -h, --help                Display this help message"
  exit 1
}

# Funktion um einfaches Passwort zu generieren gemäss Herr Ruetimann 2Wörter + Zahlen
function generate_simple_password() {
    local word_count=$1
    local num_count=$2
    local words=("Apfel" "Banane" "Kirsche" "Orange" "Erdbeere" "Himbeere" "Blaubeere" "Schule" "BBW")
    local password=""
    for ((i=0; i<$word_count; i++)); do
        password+="${words[$((RANDOM % ${#words[@]}))]}"
    done
    for ((i=0; i<$num_count; i++)); do
        password+="$((RANDOM % 90 + 10))"
    done
    echo "$password"
}

# Funktion um komplexes Passwort zu generieren
function generate_complex_password() {
    local length=$1
    local chars=""
    [[ $include_uppercase -eq 1 ]] && chars+="A-Z"
    [[ $include_lowercase -eq 1 ]] && chars+="a-z"
    [[ $include_special -eq 1 ]] && chars+="!@#\$%^&*()_+"
    local password=$(openssl rand -base64 $length | tr -dc "$chars")
    echo "$password"
}

# Funktion um Horse-staple Passwort zu generieren
function generate_horse_staple_password() {
    local word_count=$1
    local words=("Apfel" "Banane" "Kirsche" "Orange" "Erdbeere" "Himbeere" "Blaubeere" "Schule" "BBW")
    local password=""
    for ((i=0; i<$word_count; i++)); do
        password+="${words[$((RANDOM % ${#words[@]}))]}"
    done
    echo "$password"
}

# Standardwerte für optionale Parameter
include_uppercase=0
include_lowercase=0
include_special=0

# Kommandozeilenparameter verarbeiten
while [[ "$1" != "" ]]; do
    case $1 in
        -w | --words )        shift
                              words=$1
                              ;;
        -n | --numbers )      shift
                              numbers=$1
                              ;;
        -c | --complex )      shift
                              complex_length=$1
                              ;;
        -hs | --horse-staple ) shift
                              horse_staple_words=$1
                              ;;
        -u | --uppercase )    include_uppercase=1
                              ;;
        -l | --lowercase )    include_lowercase=1
                              ;;
        -s | --special )      include_special=1
                              ;;
        -h | --help )         usage
                              ;;
        * )                   usage
                              ;;
    esac
    shift
done

# Passwort generieren basierend auf den übergebenen Parametern
if [[ ! -z $words && ! -z $numbers ]]; then
    password=$(generate_simple_password $words $numbers)
elif [[ ! -z $complex_length ]]; then
    password=$(generate_complex_password $complex_length)
elif [[ ! -z $horse_staple_words ]]; then
    password=$(generate_horse_staple_password $horse_staple_words)
else
    usage
fi

echo "Generated Password: $password"
