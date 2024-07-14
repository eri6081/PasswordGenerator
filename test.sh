#!/usr/bin/bash

# Hilfefunktion
usage() {
  echo "Usage: $0 [options]"
  echo "  -w, --words <num>    Number of words for simple password"
  echo "  -n, --numbers <num>  Number of numbers for simple password"
  echo "  -c, --complex <num>  Length of complex password"
  echo "  -u, --uppercase      Include uppercase letters"
  echo "  -l, --lowercase      Include lowercase letters"
  echo "  -s, --special        Include special characters"
  echo "  -h, --help           Display this help message"
}

# Argumente parsen
while [[ "$1" != "" ]]; do
    case $1 in
        -w | --words )         shift
                               words=$1
                               ;;
        -n | --numbers )       shift
                               numbers=$1
                               ;;
        -c | --complex )       shift
                               complex_length=$1
                               ;;
        -u | --uppercase )     include_uppercase=1
                               ;;
        -l | --lowercase )     include_lowercase=1
                               ;;
        -s | --special )       include_special=1
                               ;;
        -h | --help )          usage
                               exit
                               ;;
        * )                    usage
                               exit 1
    esac
    shift
done

function EinfachesPasswort {
    words=("Apfel" "Banane" "Kirsche" "Orange" "Erdbeere" "Himbeere" "Blaubeere")
    password="${words[$((RANDOM % ${#words[@]}))]}$((RANDOM%9000+1000))"
    echo "Einfaches Passwort: $password"
}

function generate_complex_password() {
    local length=$1
    local chars=""
    [[ $include_uppercase -eq 1 ]] && chars+="A-Z"
    [[ $include_lowercase -eq 1 ]] && chars+="a-z"
    [[ $include_special -eq 1 ]] && chars+="!@#\$%^&*()_+"
    local password=$(openssl rand -base64 $length | tr -dc "$chars")
    echo "$password"
}

function generate_horse_staple_password() {
    local word_count=$1
    local words=$(sort -R words.txt | head -n $word_count | tr '\n' ' ')
    echo "${words// /}"
}


if [[ $# -eq 0 ]]; then
    echo "Bitte wähle eine Option:
          1) Einfaches Passwort generieren
          2) Komplexes Passwort generieren
          3) Horse-staple Passwort generieren"
    read -p "Auswahl: " userinput 

    case $userinput in
        1)
            password=$(generate_simple_password 2 4)
            ;;
        2)
            include_uppercase=1
            include_lowercase=1
            include_special=1
            password=$(generate_complex_password 20)
            ;;
        3)
            password=$(generate_horse_staple_password 4)
            ;;
        *)
            echo "Ungültige Auswahl"
            exit 1
            ;;
    esac
else
    if [[ ! -z $words && ! -z $numbers ]]; then
        password=$(generate_simple_password $words $numbers)
    elif [[ ! -z $complex_length ]]; then
        include_uppercase=${include_uppercase:-0}
        include_lowercase=${include_lowercase:-0}
        include_special=${include_special:-0}
        password=$(generate_complex_password $complex_length)
    else
        usage
        exit 1
    fi
fi

echo "Generated Password: $password"
