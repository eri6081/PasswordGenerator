# Passwortgenerator M122 Scripting

## Inhaltsverzeichnis

1. [Installation](#1-installation)
2. [Verwendung](#2-verwendung)
3. [Beispiele](#3-beispiele)
4. [Technologien](#4-technologien)
5. [Über dieses Projekt](#5-über-dieses-projekt)
6. [Demonstrations-Video](#6-demonstrations-video)

## Contributors: Dominik Schweizer & Eris Jakupi

## 1. Installation

Um dieses Skript auszuführen, folgen Sie bitte diesen Schritten:

1. Repository klonen oder als .zip herunterladen.
2. Stellen Sie sicher, dass WSL installiert ist. Führen Sie dann das Skript mit `bash Passwortgenerator.sh` in einem WSL-Terminal aus.

## 2. Verwendung

Nach dem Ausführen des Befehls `bash Passwortgenerator.sh` können Sie zwischen drei Arten von Passwörtern wählen:

1. Einfaches Passwort
2. Komplexes Passwort
3. Horse-Staple Passwort

## 3. Beispiele

### Beispiel 1: Einfaches Passwort generieren

```bash
Bitte wähle eine Option:
  1) Einfaches Passwort generieren
  2) Komplexes Passwort generieren
  3) Horse-staple Passwort generieren
Auswahl: 1
Generated Password: ErdbeereBanane7998169087026581
```

### Beispiel 2: Komplexes Passwort generieren

```bash
Bitte wähle eine Option:
  1) Einfaches Passwort generieren
  2) Komplexes Passwort generieren
  3) Horse-staple Passwort generieren
Auswahl: 2
Generated Password: CQGNUll+OAmnLkDH+bZIRPBA
```

### Beispiel 3: Horse-Staple Passwort generieren

```bash
Bitte wähle eine Option:
  1) Einfaches Passwort generieren
  2) Komplexes Passwort generieren
  3) Horse-staple Passwort generieren
Auswahl: 3
Generated Password: ErdbeereBananeOrangeApfel
```

### Befehlsbeispiele:

Die Beispiele kann man im File ändern und so beliebige Passwörter generieren lassen.

Ein einfaches Passwort mit 2 Wörtern und 4 Zahlen:

```bash
bash password_generator.sh -w 2 -n 4
```

Ein komplexes Passwort mit einer Länge von 20 Zeichen, mit Großbuchstaben, Kleinbuchstaben und Sonderzeichen:

```bash
bash password_generator.sh -c 20 -u -l -s
```

Ein Horse-staple Passwort mit 4 Wörtern:

```bash
bash password_generator.sh -w 4
```

## 4. Technologien

![Technologien](image.png)

## 5. Über dieses Projekt

In diesem Projekt haben wir die Aufgabe erhalten, ein Bash-basiertes Projekt zu erstellen. Dominik und ich haben uns dazu entschieden, einen Passwortgenerator in Bash zu entwickeln. Dieser Generator kann einfache, komplexe und Horse-Staple Passwörter generieren.


## 6. Demonstrations-Video 

Das Demo-Video findet man unter folgendem Pfad in unserem Repository.

 => (https://github.com/eri6081/PasswordGenerator/tree/Main/Demo-Video)