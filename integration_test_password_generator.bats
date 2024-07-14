#!/usr/bin/env bats

# Test für einfache Passwortgenerierung über interaktive Eingabe
@test "Interactive simple password generation" {
  run bash -c 'echo -e "1\n" | ./password_generator.sh'
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
}

# Test für komplexe Passwortgenerierung über interaktive Eingabe
@test "Interactive complex password generation" {
  run bash -c 'echo -e "2\n" | ./password_generator.sh'
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
  [ "${#output}" -ge 21 ] # 20 characters + "Generated Password: "
}

# Test für Horse-staple Passwortgenerierung über interaktive Eingabe
@test "Interactive horse-staple password generation" {
  run bash -c 'echo -e "3\n" | ./password_generator.sh'
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
}

# Test für keine Eingabe (zeigt Usage an)
@test "No input shows usage" {
  run ./password_generator.sh
  [ "$status" -eq 1 ]
  [[ "$output" =~ "Bitte wähle eine Option:" ]]
}
