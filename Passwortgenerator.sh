function EingabeNutzer 
{
    read -p "Gebe bitte deine Auswahl an 
            1) einfaches Passwort generieren
            2) komplexes Passwort generieren
            3) horse-staple Passwort generieren " Userinput 

    if [ $Userinput -eq 1 ]; then  
    
        EinfachesPasswort()

    elif [ $Userinput -eq 2 ]; then 
    {
        KomplexesPasswort()
    }

    else 
    {
        HorseStaple()
    }


    fi
    
    
}

