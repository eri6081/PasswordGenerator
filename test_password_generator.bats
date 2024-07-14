#!/usr/bin/env bats

# Test für die Hilfefunktion
@test "Usage function displays help" {
  run ./password_generator.sh -h
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Usage:" ]]
}

# Test für einfache Passwortgenerierung (2 Wörter, 4 Zahlen)
@test "Generate simple password with 2 words and 4 numbers" {
  run ./password_generator.sh -w 2 -n 4
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
}

# Test für komplexe Passwortgenerierung (Länge 20, alle Charaktertypen)
@test "Generate complex password with length 20" {
  run ./password_generator.sh -c 20 -u -l -s
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
  [ "${#output}" -ge 21 ] # 20 characters + "Generated Password: "
}

# Test für Horse-staple Passwortgenerierung (4 Wörter)
@test "Generate horse-staple password with 4 words" {
  run ./password_generator.sh -w 4
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Generated Password: " ]]
}

# Test für ungültige Option
@test "Invalid option returns error" {
  run ./password_generator.sh --invalid
  [ "$status" -eq 1 ]
  [[ "$output" =~ "Unknown parameter passed" ]]
}
