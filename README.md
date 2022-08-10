# Database-Projekt in VisualStudio Dokumentation

### Die Erstellung und Bearbeitung einer neuen oder schon vorhandenen Datenbank in Microsoft VisualStudio.

## Installation und Einrichtung der Infrastruktur

### 0.1 Installation von VisualStudio und benötigte Toolsets

1. Laden Sie [Microsoft VisualStudio](https://visualstudio.microsoft.com/ "Download here") herunter und installieren Sie es.
2. Danach klicken Sie im **VisualStudio Installer** auf "_Ändern_" bei Ihrer VisualStudio Installation.
3. Scrollen Sie im neuen Fenster bis "_Andere Toolsets_" und wählen Sie "_Datenspeicherung und -Verarbeitung_" aus.
4. Stellen Sie sicher das in der Liste rechts "_SQL Server Data Tools_" ausgewählt ist und klicken Sie rechts unten auf "_Ändern_".
5. Nach erfolgreicher Installation starten Sie VisualStudio

---

### 0.2 Database Projekt erstellen

1. Wählen Sie auf der rechten Seite "_Create a new project_" oder "_Erstellen Sie ein neues Projekt_".
2. Suchen Sie im neuen Fenster nach "_Database_" und wählen Sie "_SQL Server Database Project_" aus und klicken auf "_next_".
3. Geben Sie unter "_Projekt Name_" einen Namen für ihr Projekt sein. Der Name ist **komplett unabhängig** von dem SQL Server oder seiner Databases. Daher muss der Name weder noch gleich oder ähnlich sein.
4. Optional können Sie auch den Speicherort ändern.
5. Klicken Sie danach auf "_Erstellen_"

---

---

## Handling im VisualStudio

Die folgenden Anleitungen müssen nicht hintereinander ausgeführt werden. Es sind einzelne Anweisungen für verschiedene Anwendungen.

Mit **Serverdatenbank** ist eine Datenbank gemeint, welche live auf einem SQL-Server läuft.

Mit **Projektdatenbank** ist eine Datenbank "Struktur" gemeint, welche auf keinem Server aktiv ist und unter dem VisualStudio Projekt gespeichert ist. Diese kann jedoch, sofern keine Fehler vorhanden sind, auf einen SQL-Server geladen und dort eingesetzt werden.

---

### 1.1 Database "Struktur" aufbauen und auf SQL-Server erstellen

1. Mit [Strg + Alt + L] den **Solution Explorer** aufrufen und dort "_Database1_" zu gewünschten Namen mit _Rechtsklick_ -> _Umbenennen_ umändern.
2. _Dies ist nur optional, es dient jedoch zu einer besseren Übersicht und einfacherem Verständnis._ _Rechtsklick_ auf die soeben umbenannte Datenbank -> "_Hinzufügen_" -> "_Ordner_". Der Ordner wird standartmäßig "_dbo_" genannt. Danach erstellen Sie mit _Rechtsklick_ auf "_dbo_" -> "_Hinzufügen_" -> "_Ordner_" drei weitere Ordner bis eine Orderstruktur wie folgt entstanden ist.
   - dbo
     - Tables
     - Views
     - Stored Procedures
3. Um unsere erste Tabelle zu erstellen _Rechtsklick_ auf "Tabelle" -> "_Hinzufügen_" -> "_Tabelle_". Im neuen Fenster kann unten ein Name angegeben werden. Der Name wird standartmäßig als Tabellenname und als ".sql" Dateiname verwenden.  
   (Der ".sql" Dateiname ist nicht wichtig für die Datenbank, er sollte jedoch für einfacheres Arbeiten gleich wie die Tabelle sein welche die Datei erstellt.) Danach auf "_Hinzufügen_" klicken.
4. Jetzt sollten sich in der Mitte des Bildschirmes zwei Fenster öffnen. Das Obere ist das Tabellen-Design und das Untere enthält den SQL-Code dafür.  
   (Sobald eine Änderung in einer der zwei Fenstern gemacht wird aktualiSiert sich das jeweils andere Fenster und passt sich an.)
5. Um neue Spalten für diese Tabelle zu erstellen, klickt man einfach auf die leere Zeile unter "Id" und gibt Namen, Datentypen, Nullerlaubnis und Normalwert an. Durch _Enter_ wird die Spalte erstellt und im SQL-Code Fenster wird die neue Zeile sichtbar. Die Zeile "Id" kann natürlich auch noch geändert werden und wird in den meisten Fällen zur UID.
6. (**optional**) Mit der Funktionstaste [F4] kann das Fenster **Eigenschaften** aufgerufen werden. Man kann dort ganz einfach eine Automatische ID Zuweisung für die UID Spalten einstellen. 1. Einfach die gewünschte Zeile (UID Spalte) auswählen und in den Eigenschaften unter "_Tabellen Designer_" -> "_Identitäts Spezifikationen_" "(Is Identity)" auf _true_ setzten.  
   (Mit den kleinen Pin-Symbolen kann man den **Solution Explorer** und die **Eigenschaften** auf einer Seite fixieren und untereinander anzeigen lassen)
7. Sie können auch eine Tabelle im SQL-Code Fenster erstellen indem Sie dort die gewünschten Spalten mit folgendem Syntax erstellen.

   - [{Spaltenname}] {Datentyp} {Nullerlaubnis},
   - Die Spitzklammern {} sollten nicht geschrieben werden.
   - {Spaltenname} und {Datentyp} sollen mit dem dementsprechenden Namen und Datentypen ersetzt werden.
   - {Nullerlaubnis} kann entweder durch "NUll" oder "NOT NULL" ersetzt werden.

8. Beispielcode: Produkttabelle mit automatischer ID Zuweisung

```SQL
CREATE TABLE [dbo].[Produkte]s
(
	[ProduktID] INT NOT NULL PRIMARY KEY IDENTITY,
    [ProduktName] VARCHAR(50) NULL,
    [ProduktKategorie] VARCHAR(50) NULL,
    [Stückpreis] DECIMAL(10, 2) NULL,
    [Beschreibung] VARCHAR(100) NULL
)
```

9. Die fertige Tabellen Datei kann durch [Strg + S] gespeichert und nach Abschluss dessen Bearbeitung auch geschlossen werden.
10. Als Nächstes wird eine "Beziehung" ein "View" und eine "stored Procedure" erstellt.
11. Um eine simple nicht redundante Beziehung zu erstellen wird eine zweite Tabelle benötigt. Dafür einfach **Schritt 3** wiederholen und die zweite Tabelle erstellen und mit Spalten füllen.
12. Beispielcode: Lagertabelle

```SQL
CREATE TABLE [dbo].[Lager]
(
    [ProduktNummer] INT NOT NULL PRIMARY KEY,
    [Stückzahl] INT NULL
)
```

13. Um die Beziehung zu erstellen "_Rechtsklicken_" Sie in der Lager Tabelle, oder ihrer eigenen Fact Tabelle auf der Design Seite auf "_Fremdschlüssel_" -> "_neuen Fremdschlüssel hinzufügen_" und geben Sie dem einen Namen wie in meinem Fall "FK_Lager_Produktschlüssel".
14. Jedoch ist unter "_Fremdschlüssel_" kein neuer Fremdschlüssel. Der Fremdschlüssel wurde jedoch trotzdem erstellt, im SQL-Code Fenster sollte jetzt diese Zeile hinzugefügt worden sein.

```SQL
CONSTRAINT [FK_Name] FOREIGN KEY ([Column]) REFERENCES [ToTable]([ToTableColumn])
```

15. Das ist der Aufbau einer Beziehung jedoch müssen [Column], [ToTable] und [ToTableColumn] noch mit unseren Namen ausgetauscht werden. Die beiden Schlüsselspalten **müssen den gleichen Datentypen** haben!
    - Die Eckklammern [] müssen zwar nicht aber sollten geschrieben werden, besonders wenn Sonderzeichen vorkommen.
    - Primär- und Fremdschlüssen sind aus der Fact-Table Ansicht
    - [Column] wird durch die Primärschlüssel-Spalte ausgetauscht
    - [ToTable] wird durch die Tabelle die den Fremdschlüssel enthaltet ausgetauscht
    - [ToTableColumn] wird durch die Fremdschlüssel-Spalte ausgetauscht
16. Beispielcode: Beziehung Lagertabelle zu Produkttabelle

```SQL
CONSTRAINT [FK_Lager_Produktschlüssel] FOREIGN KEY ([ProduktNummer]) REFERENCES [Produkte]([ProduktID])
```

17. Ist alles eingetragen so kann die Tabelle gespeichert und geschlossen werden.
18. Ein "View" zu erstellen ist sehr einfach und kann durch einen "_Rechtsklick_" auf "Views" -> "_Hinzufügen_" -> "_View_". Im neuen Fenster kann wieder ein Name eingegeben werden. Danach auf "_Hinzufügen_" klicken.
19. Hier kann nun ein beliebiges "View" erstellt werden und mit [Strg + S] gespeichert werden.
20. Beispielcode: View um alle Produktnamen und deren Stückzahlen anzuzeigen

```SQL
CREATE VIEW [dbo].[Lagerzahlen]
	AS SELECT l.ProduktNummer, l.Stückzahl, p.ProduktName
	FROM [Lager] as l left join [Produkte] as p on l.ProduktNummer = p.ProduktID
```

21. Nach Abschluss dieses "View" speichern und schließen.
22. Eine "stored procedure" kann ebenso einfach erstellt werden. "_Rechtsklick_" auf "Stored Procedures" -> "_Hinzufügen_" -> "_Stored Procedure_", Namen eingeben und "_Hinzufügen_" klicken.  
    (Eine "stored procedure" kann anders als "Views" auch Parameter verwenden.)
23. Beispielcode: Stückzahl eines einzelnen Produktes

```SQL
CREATE PROCEDURE [dbo].[StückzahlCheck]
	@Produktnummer int
AS
	SELECT l.Stückzahl, p.ProduktName
	FROM [Lager] as l left join [Produkte] as p on l.ProduktNummer = p.ProduktID
	WHERE p.ProduktID = @Produktnummer
```

24. Jetzt können Sie nach Belieben Tabellen, Beziehungen, Views und stored Procedures erstellen. Wenn Sie mit ihrer Datenbank "Rohbau" fertig sind können wir diesen nun auf einen SQL-Server hochladen, da alles was bis jetzt gemacht wurde nur Scripte sind, welche unsere Datenbank erstellen kann.
25. **Folgendes setzt einen bereits fertig erstellten SQL-Server voraus.**
26. [Strg-Shift-S] drücken um alles zu Speichern und danach "_Rechtsklick_" auf unsere Datenbank -> "_Optionen_". Im neuen Fenster unter "_Projekt Optionen_" bei "_Zielplattform_" die SQL-Server Version des Ziel-Servers auswählen. Danach die "_Projekt Optionen_" wieder schließen.
27. "_Rechtsklick_" auf unsere Datenbank -> "_Veröffentlichen_". Im neuen Fenster klicken Sie auf "_Bearbeiten_" um einen SQL-Server auszuwählen. Falls der gewünschte Server nicht unter "Browse" zu sehen, ist müssen dessen Namen und Authentifizierungsdaten manuell eingegeben werden. Für "_Datenbank Name_" wird nichts ausgewählt, da wir ja eine neue erstellen wollen. Auf "_Verbindung testen_" klicken und bei einem Fehler die angegebenen Daten und den Serverstatus überprüfen. Danach auf "_Ok_" klicken und zum "Datenbank veröffentlichen" Fenster zurückkehren.
28. Hier unter "_Datenbank Name_" den Namen der zu erstellenden Datenbank eingeben und auf "_Veröffentlichen_" klicken.
29. Öffnet man nun über "_Ansicht_" den "_SQL Server Objekt Explorer_" findet man unter "_SQL Server_" den verbundenen SQL-Server in dessen Orderstruktur unter "_Databases_" die soeben erstellte Datenbank und darunter die erstellten Tabellen, Views und stored Procedures.  
    (stored Procedures werden unter "_Programmability_" gespeichert.)
30. Alle Änderungen die in der Projektdatenbank (nicht direkt am Server) gemacht werden müssen neu übertragen werden mit **Anleitung 1.4**.

---

### 1.2 Schon vorhandene Datenbank in VisualStudio verwenden

Hier werde nur Tabellen, Views, stores Procedures, usw. übertragen, **kein Daten**

Um eine Serverdatenbank zu importieren darf keine SQL Datei unter dem Projekt bereits vorhanden sei. d.h. Ist eine Datenbank schon importiert muss diese (alle Dateien mit der Endung ".sql") zuerst aus dem Projekt gelöscht werden.

1. Mit [Strg + Alt + L] den **Solution Explorer** aufrufen und dort "_Database1_" zu gewünschten Namen mit _Rechtsklick_ -> _Umbenennen_ umändern.
2. _Rechtsklick_ auf die gerade umbenannte Projektdatenbank -> "_Importieren_" -> "_Datenbank_". Im neuen Fenster "_Verbindung auswählen_" anklicken und erkannte Datenbankverbindung auswählen oder manuell Servername, Datenbank Name und Authentifikationsdaten eingeben.
3. **(optional)** Hier können noch weitere Einstellungen getroffen werden.
4. Auf "_Start_" klicken, auf Fertigstellung warten und danach auf "_Abschließen_" klicken.
5. Jetzt sollte unter der Projektdatenbank ein Ordner mit dem Namen "dbo" sein welche alle Objekte und Scripte der Serverdatenbank enthält.
6. Die Projektdatenbank kann jetzt beliebig bearbeitet werden **(Siehe ab 1.1.3)** und danach wieder eingesetzt werden **(Siehe 1.4)**.

---

### 1.3 Neue Objekte in Projektdatenbank erstellen

1. In dem mit [Strg + Alt + L] zu öffnendem **Solution Explorer**, _Rechtsklick_ auf einen beliebigen Ordner. (Am Besten ein passender Ordner der zu der Kategorie des zu erstellenden Objektes passt. **(Siehe 1.1.2)**) -> "_Hinzufügen_" -> "_neues Objekt_".
2. Im neuen Fenster gibt es eine Menge an zu erstellenden Objekten. Wenn das richtige gefunden ist, einfach auswählen im unteren Feld einen Namen und auf "_Hinzufügen_" klicken.
3. Jetzt kann das Objekt bearbeitet, und danach mit [Strg + S] gespeichert werden.  
   (gespeicherte Objekte (im gespeicherten Zustand auf der Projektdatenbank eigentlich nur SQL-Skripte) können mit "Drag- & Drop" unter andere Ordner verschoben werden)

---

### 1.4 Projektdatenbank einfacher übertragen

1. [Strg-Shift-S] drücken um alles zu Speichern und danach "_Rechtsklick_" auf unsere Datenbank -> "_Optionen_". Im neuen Fenster unter "_Projekt Optionen_" bei "_Zielplattform_" die SQL-Server Version des Ziel-Servers auswählen. Danach die "_Projekt Optionen_" wieder schließen.
2. _Rechtsklick_ auf gewünschte Projektdatenbank -> "_Veröffentlichen_".
3. Im neuen Fenster "_Bearbeiten_" anklicken und im neuen "Verbindungs" Fenster die automatisch erkannte Verbindung auswählen oder Servername, Datenbank Name und Authentifikationsdaten manuell eingeben. Danach auf "_Ok_" klicken.
4. Kontrollieren ob "Datenbank Name" stimmt und danach auf "_Profil speichern unter..._" klicken. Die Datei im vorausgewählten Ort abspeichern und nach Belieben umbenennen. **Die Dateiendung ".publish.xml" darf nicht gelöscht oder geändert werden.**
5. Jetzt sollte automatisch eine neue Datei unter dem Projekt liegen. Diese hat den Nutzten, dass Sie auf Doppelklick automatisch die vorherigen ausgewählten Daten in das "Veröffentlichen" Fenster einträgt und man nur noch auf "_Veröffentlichen_" drücken muss.

---

### 1.5 Verbindung zu SQL-Server ohne Import aufbauen

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" öffnen und dort _Rechtsklick_ auf "_SQL Server_" -> "_SQL Server hinzufügen_".
2. Im neuen "Verbindungs" Fenster die automatisch erkannte Verbindung auswählen oder Servername, Datenbank Name und Authentifikationsdaten manuell eingeben. Danach auf "_Connect_" klicken.

---

### 1.6 Serverdatenbank direkt bearbeiten

Um dies möglich zum machen ist eine vorhanden Verbindung zu einem SQL-Server vorausgesetzt. **(Siehe 1.5)**

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" öffnen und "SQL Server" bis zu der Datenbank Orderstruktur öffnen.
2. Mit _Rechtsklick_ auf "_Tables_","_Views_", "_Stored Procedures_"(unter "_Programmability_"),... kann ein jeweils Neues erstellt werden.
3. Mit _Doppelklick_ oder _Rechtsklick_ -> "_Design anschauen_" auf ein vorhandenes Objekt (Tabelle, View, stored Procedure,...) kann dies bearbeitet und mit "_AktualiSieren_" hochgeladen **(Siehe ab 1.6.5)** werden.
4. Als Beispiel eine neue Tabelle. _Rechtsklick_ auf den Ordner "_Tables_" -> "_neue Datentabelle_". Hier kann man gleich arbeiten wie bei **1.1.4 bis 1.1.7**.
5. Hier werden Objekte jedoch nicht mit [Strg + S] gespeichert sondern mit "_AktualiSieren_". Der Button ist links ober dem Tabllen-Design Feld.
6. Im neuen Fenster sicherstellen, dass der Haken bei "transactional scripts inkludieren" da ist und dann auf "_Datenbank aktualiSieren_" klicken. **Dieser Schritt ist jedoch nur einmalig pro Neustart möglich und wird bei _Antwort 2.2_ ausführlicher erklärt.**
7. Eine solche AktualiSierung erfolgt jedoch nur auf der Serverdatenbank. Um die AktualiSierung auch auf die Projektdatenbank zu übertragen muss **Anleitung 1.2** ausgeführt werden.

---

### 1.7 SQL Abfragen schreiben und ausführen

Abfragen können nur am auf der Serverdatenbank ausgeführt werden, da die Projektdatenbank keine Daten enthält. Deshalb ist eine Verbindung zu einem SQL-Server von Nöten.

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" öffnen und "SQL Server" bis zu gewünschter Datenbank ausklappen und _Rechtsklick_ auf diese -> "_neue Abfrage_".
2. Es sollte automatisch die richtige Datenbank ausgewählt haben. Falls nicht kann diese bei dem Dropdown-Menü über dem SQL-Textfeld geändert werden.
3. Im SQL-Textfeld können normale Abfragen geschrieben aus ausgeführt werden.
4. **Abfragen werden mit [Strg + Shift + E] oder dem grünen Pfeil über der SQL-Textfeld gestartet Nicht mit dem grünen Pfeil mit dem Text "Start", dieser startet den Build für das Projekt** Es kann alle Abfragen in der Datei ausführen (wenn keine markiert ist) oder nur die Markierten.
5. Die SQL-Datei muss lokal gespeichert oder Verworfen werden und kann nicht auf den Server geladen werden.

---

### 1.8 Manuell Daten in Serverdatenbank laden

Dies ist nur für Testung zu empfehlen, da man jede Zeile manuell befüllen muss.

Daten können nur in die Serverdatenbank geladen werden. Deshalb ist eine Verbindung zu einem SQL-Server benötigt.

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" öffnen und "SQL Server" bis zu den Tabellen öffnen.
2. _Rechtsklick_ auf die gewünschte Tabelle und "_Daten anschauen_" klicken.
3. Hier kann man nun Daten manuell eintippen und mit _Enter_ bestätigen.
4. Dies benötigt **kein _"AktualiSieren"_** oder Speichern mit [Strg + S] wie bei **Schritt 1.6.5**, die Speicherung erfolgt automatisch durch das Drücken von _Enter_ nach jeder Zeile.

---

### 1.9 Schemavergleiche ausführen

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" oder **Solution Explorer** öffnen und eine der zu Vergleichenden Datenbanken in der Ordnerstruktur auffinden
2. _Rechtsklick_ auf eine der zu vergleichenden Tabellen -> "_Schema Vergleich_".
3. Als nächstes bei "_Ziel auswählen_" die zweite Datenbank, entweder eine Projektdatenbank oder eine Serverdatenbank, auswählen und danach mit "_Ok_" bestätigen.
4. Der Vergleich kann mit "_Vergleichen_" gestartet werden. Nach kurzer Zeit werden Ungleichheiten aufgelistet und können aus- und abgewählt werden.  
   (Es werden immer Ungleichheiten angezeigt welche die rechte Seite hat, bzw die rechte Seite wird von der AktualiSierung beeinflusst)
5. Nach der gewünschten Auswahl kann mit "_AktualiSieren_" die Änderungen durchgeführt werden.
6. **(optional)** Dieser Vergleich kann nach Bedürfnis auch gespeichert werden um die **Schritte 1.9.1 bis 1.9.3** in Zukunft überspringen zu können.

---

### 1.10 Datenvergleiche ausführen

Um Datenvergleiche durchzuführen müssen die beiden Datenbanken die gleiche Tabellen haben bzw. die zu vergleichenden Daten müssen in gleichnamigen Tabellen mit der gleichen Struktur sein. Vor einem Datenvergleich sollte ein Schemavergleich **(Anleitung 1.9)** durchgeführt werden.

1. Über "_Ansicht_" den "_SQL Server Objekt Explorer_" öffnen und eine der zu Vergleichenden Datenbanken in der Ordnerstruktur auffinden.
2. _Rechtsklick_ auf eine der zu vergleichenden Tabellen -> "_Daten Vergleich_".
3. Im neuen Fenster unter "_Verbindung auswählen_" die zweite Datenbank auswählen und danach mit "_weiter_" weiter.
4. Jetzt kann ausgewählt werden ob Tabellen und/oder Views verglichen werden. Der Vergleich kann mit "_Abschließen_" gestartet werden. Nach kurzer Zeit werden Ungleichheiten aufgelistet und können aus- und abgewählt werden.  
   (Es werden immer Ungleichheiten angezeigt welche die rechte Seite hat, bzw die rechte Seite wird von der AktualiSierung beeinflusst)
5. Nach der gewünschten Auswahl der zu übertragenden Daten kann mit "_AktualiSieren_" die Änderungen durchgeführt werden.
6. **(optional)** Dieser Vergleich kann nach Bedürfnis auch gespeichert werden um die **Schritte 1.9.1 bis 1.9.3** in Zukunft überspringen zu können.

---

### 1.11 Aktionen mehrere Male in verschieden Umgebungen durchführen mit Änderungsskripts.

Datenbank Projekte in VisualStudio haben den Vorteil, dass alle AktualiSierungen oder Veröffentlichungen über Skripte funktionieren. Das heißt, dass Aktionen wie eine Tabellenänderung einfach als Skript gespeichert werden kann und dies in anderen SQL Umgebungen wieder ausgeführt werden kann.

1. In fast jedem Fenster gibt es einen Kopf "Skript erzeugen" oder "Skript anzeigen", dieser Erzeugt ein Skript welches wie der der Beschreibung erklärt wiederverwendbar ist und seine Funktion auch in anderen Umgebungen ausführen kann.
   (Dies Erfordert natürlich die richtigen Namen und Bezeichnungen.)

---

---

## FAQ

### 2.1 Kann ich auch VisualStudio Code benutzten?

Nein aber teilweise.  
Grundsätzlich kann man nur VisualStudio für Database Projekte verwenden, da VisualStudio ein IDE (Integrated Development Environment) und VistualStudio Code nur ein Code Editor ist. Jedoch kann man in VisualStudio Code SQL schreiben, dies ist jedoch auch nicht allzu sinnvoll, da man in VisualStudio eine Design Seite (nur für Tabellen), IntelliSense und bessere Debug-Möglichkeiten hat, welche das Arbeiten sehr stark erleichtern.  
Ich würde von der Verwendung von VisualStudio Code bei einem Database Projekt stark abraten.

---

### 2.2 Warum muss ich nach jeder ServeraktualiSierung das Projekt neustarten?

Dies ist leider ein Bug für den es noch keine Lösung gibt. Das Problem äußert sich durch das unendliche Laden beim Versuch eine Serverdatenbank zu aktualiSieren. Das Problem kann kurzzeitig umgangen werden indem man das Projekt schließt und neu öffnet, danach kann man eine Änderung durchführen. **Achtung, die noch nicht übertragene Änderung geht beim Neustart verlorern** d.h. Die Datei in der eine Änderung durchgeführt werden soll bitte vor Neustart mit [Strg + S] speichern und danach wieder aufrufen oder den SQL-Code einfacht mit [Strg + c] vor Neustart kopieren und nach Neustart im gleichen Fenster mit [Strg + V] einfügen.

---

### 2.3 Kann ich ganz auf Microsoft SQL Server Management Studio verzichten?

Eigentlich ja.

Es ist möglich alle Tätigkeiten welche in SSMS durchgeführt werden auch in VisualStudio zu machen bis auf eine Änderungen des Authentifizierungsmodus. Dies ist nur in SSMS oder über SQL Registry Abfragen möglich. Dies wird bei **Schritt 2.5** beschrieben.

---

### 2.4 Was pasSiert mit Daten in der Datenbank?

Das kommt auf die Handhabung mit der Datenbank an. Wenn man eine Serverdatenbank mit Daten in VisualStudio importiert werden die Daten nicht übertragen, da VisualStudio nur die "Infrastruktur" einer Datenbank speichert. Fügt man beispielsweise bei einer mit Daten befüllten Tabelle eine weiter Spalte hinzu und ladet diese Datenbank wieder auf den Server, sollte es keine Konflikte geben. Die Daten bleiben erhalten und die neue Spalte wird mit den Normalwerten ausgefüllt.

Löscht man jedoch eine Spalte aus einer Tabelle und ladet dessen Datenbank wieder auf den Server entsteht ein Konflikt. (Auch wenn die gelöschte Spalte nur mit "_NULL_" gefüllt ist). Da die Übertragung auf den Server nur aus einem Skript besteht kann man das enthaltene "_if_ " und "_RAISEERROR_" welche den Konflikt auslösen einfach löschen oder mit "--" auskommentieren um dies zu umgehen. Die Spalte wird bei erneuter Ausführung des Scriptes **(nicht der AktualiSierung selbst)** erfolgreich gelöscht und dessen Daten gehen verloren. Die Daten in den anderen Spalten der Tabelle bleiben vorhanden.

---

### 2.5 Wie funktionieren Login, Benutzer und Rollen in VisualStudio?

Es ist auf dem Projektserver ganz einfach mit **Schritt 1.3** möglich Logins, Benutzer und Rollen mit simplen SQL erstellen, diese Rollen werden nach Veröffentlichung der Datenbank auf dem Server bzw. Serverdatenbank erstellt.
Jedoch ist es leider nicht möglich den Authentifizierungsmodus im VisualStudio zu ändern, also von "Integrated" (nur Windowslogin) zu "Mixed" (Windows- und SQL-Server-Login) zu ändern. Die einzige Möglichkeit dies ohne _SQL Server Management Studio_ zu machen ist durch die "Registry". Dies erfordert jedoch **Adminrechte und extreme Vorsicht** da ein Fehler in der Registry fatale Folgen auf die Gesundheit des bearbeiteten Computers haben kann.

Mit diesem SQL-Code wird der Modus auf Integrated (nur Windowslogin) gesetzt, tauscht man hier die 1 durch eine 2 aus wird der Modus auf "Mixed" (Windows und SQL-Server-Login) gesetzt.

```SQL
USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
     N'Software\Microsoft\MSSQLServer\MSSQLServer',
     N'LoginMode', REG_DWORD, 1
GO
```

Da ein solches Verfahren Risiken mit sich bringt, ist davon abzuraten. Der Authentifizierungsmodus solle bei Erstellung des SQL-Servers eingestellt werden.

---

### 2.6 Wie funktioniert eine Produktions-Pipeline in VisualStudio?

Dies ist am besten mit "Schema Vergleichen" möglich. Diese werden in Anleitung 1.9 ausführlich erklärt. Mit diesen kann man sowohl Test auf Dev und Dev auf Prod Datenbanken übertragen als auch Prod zurück auf Dev.

---

### 2.7 Kann ich Git verwenden?

Ja, ganz einfach über den "_Team Explorer_" ein Repository erstellen. Änderungen können mit "_committ_" und "_push_" dann hochgeladen werden.

---

---

## Vor- und Nachteile bei der Verwendung von VisualStudio

|                        Vorteile                        |                     Nachteile                      |
| :----------------------------------------------------: | :------------------------------------------------: |
|                Debugging Möglichkeiten                 |                unbekannte Umgebung                 |
|         einfache Speicherung von Verbindungen          |        etwas komplizierte Benutzoberfläche         |
|   Erstellung von wiederverwendbaren Infrastrukturen    |         störender unbehobener "Update-Bug"         |
| Übertragung funktioniert über Scripte -> Anpassbarkeit | Authentifizierungsmodus kann nicht geändert werden |

---
