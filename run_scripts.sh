#!/bin/bash

# DB2 starten
db2start

# Verbindung zur Datenbank herstellen
db2 connect to dbbw001

# Durch die UEB-Scripts iterieren
for script in UEB03-{00..04}.sql; do
  # Führe das UEB-Script aus
  db2 -tvf "${script}"

  # Warte 10 Sekunden
  sleep 10

  # Führe das cleanup.sql-Script aus
  db2 -tvf cleanup.sql
  clear
done

# Exit-Code 0 (erfolgreich) zurückgeben
exit 0
