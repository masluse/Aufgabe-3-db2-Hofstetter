###############################################
# README.txt
# Anleitung zum Ausführen der SQL-Scripts
###############################################

In diesem Verzeichnis finden Sie die korrigierten SQL-Scripts und ein Bash-Skript zum sequenziellen Ausführen der Scripts. Stellen Sie sicher, dass Sie über DB2 und die notwendigen Berechtigungen verfügen, um die Skripte auszuführen.

Voraussetzungen:
- DB2 ist installiert und eingerichtet
- Sie haben die notwendigen Berechtigungen zum Erstellen und Verwalten von Tabellen und Indizes

Schritte zum Ausführen der SQL-Scripts:

1. Öffnen Sie ein Terminalfenster.
2. Navigieren Sie zum Verzeichnis, in dem sich die SQL-Scripts und das Bash-Skript befinden.
3. Stellen Sie sicher, dass das Bash-Skript "run_scripts.sh" ausführbar ist. Sie können dies tun, indem Sie den folgenden Befehl ausführen:

   chmod +x run_scripts.sh

4. Führen Sie das Bash-Skript "run_scripts.sh" aus, indem Sie den folgenden Befehl eingeben:

   ./run_scripts.sh

Das Skript wird die SQL-Scripts in der angegebenen Reihenfolge ausführen und anschließend das bereitgestellte cleanup.sql-Script ausführen. Bei schwerwiegenden Fehlern bricht das Skript den Vorgang ab und zeigt eine Fehlermeldung an. Bei weniger schwerwiegenden Fehlern, wie z. B. Duplikaten oder bereits vorhandenen Indizes, zeigt das Skript eine Warnung an, setzt die Ausführung jedoch fort.

Achten Sie darauf, dass Sie das Skript gemäß den Anweisungen im README.txt ausführen, um sicherzustellen, dass alle notwendigen Objekte in der Datenbank erstellt werden.
