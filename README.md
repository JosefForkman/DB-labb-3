# DB-labb-3-4

## Vad du ska göra labb 4
I detta projekt ska du bygga klart en helt fungerande applikation för den fiktiva skola du jobbat med i de senaste labbarna. Du ska alltså skapa en Console-applikation som skolan kan använda och som har den funktionalitet som efterfrågas nedan.

### Funktioner i programmet:

Här följer de funktioner du ska bygga i ditt program.

- [x] Det måste finnas en meny där man kan välja att visa olika data som efterfrågas av skolan. (Console)
- [x] Hur många lärare jobbar på de olika avdelningarna? (EF)
- [x] Visa information om alla elever (t.ex namn, klass och annat som är intressant/relevant i din databas) (EF)
- [x] Visa en lista på alla aktiva kurser (EF)
- [x] Skolan vill kunna ta fram en översikt över all personal där det framgår namn och vilka befattningar de har samt hur många år de har arbetat på skolan. Administratören vill också ha möjlighet att spara ner ny personal. (SQL via ADO.Net)
    - [x] namn
    - [x] befattning
    - [x] anställningsdatum
    - [x] antal år på skolan
    - [x] skapa ny personal
    - [x] använd ADO.Net
- [x] Vi vill kunna ta fram alla betyg för en elev i varje kurs/ämne de läst och vi vill kunna se vilken lärare som satt betygen, vi vill också se vilka datum betygen satts. (SQL via ADO.Net)
    - [x] Se betyg för en specifik elev i varje kurs/ämne
    - [x] Se vilken lärare som satt betyget
    - [x] Se datum för betyget
- [x] Hur mycket betalar respektive avdelning ut i lön varje månad? (SQL via ADO.Net)
    - [x] Lönekostnad per avdelning
- [x] Hur mycket är medellönen för de olika avdelningarna? (SQL via ADO.Net)
    - [x] Medellön per avdelning
- [ ] Skapa en Stored Procedure som tar emot ett Id och returnerar viktig information om den elev som är registrerad med aktuellt Id. (SQL via ADO.Net)
    - [ ] Stored Procedure
    - [ ] tar emot Id
    - [ ] returnerar information om elev
- [ ] Sätt betyg på en elev genom att använda Transactions ifall något går fel. (SQL via ADO.Net)
    - [ ] Sätt betyg
    - [ ] Använd Transactions


### ⚙ Extra utmaningar
1. Visa information om en elev, vilken klass hen tillhör och vilken/vilka lärare hen har samt vilka betyg hen har fått i en specifik kurs. (SQL via ADO.Net)
2. Skapa en View som visar alla lärare och vilka utbildningar de ansvarar för. (SQL via ADO.Net)
3. Uppdatera/korrigera en elevs information via kod. (EF)


## Vad du ska göra labb 3

- [ ]  Fyll på din databas från labb 2 med lite mer exempeldata i alla tabeller.
- [ ]  Skapa ett nytt console-program i C#
- [x]  Skapa en enkel navigation i programmet som gör att användaren kan välja mellan följande funktioner.


### Via Entity framework : Console

- [x]  Hämta alla elever.
    
    Användaren får välja om de vill se eleverna sorterade på för- eller efternamn och om det ska vara stigande eller fallande sortering.
    
- [x]  Hämta alla elever i en viss klass.
    
    Användaren ska först få se en lista med alla klasser som finns, sedan får användaren välja en av klasserna och då skrivs alla elever i den klassen ut.
    
    Extra utmaning: låt användaren även få välja sortering på eleverna som i punkten ovan.
    
- [x]  Lägga till ny personal (ska lösas genom Entity framework)
    
    Användaren ska få möjlighet att mata in uppgifter om en ny anställd och den datan sparas då ner i databasen.

### Via SQL : Azure Data Studio (Query-fil eller notebook-fil)

- [x]  Hämta personal
    
    Databasadministratören får välja om denna vill se alla anställda, eller bara inom en av kategorierna så som ex lärare. (Skriv t.ex. två queries eller lös det på annat vis med hjälp av stored procedure)
    
- [x]  Hämta alla betyg som satts den senaste månaden
    
    Här får användaren se en lista med alla betyg som satts senaste månaden där elevens namn, ämnet och betyget framgår.
    
- [x]  Hämta en lista med alla ämnen och det snittbetyg som eleverna fått i det ämnet samt det högsta och lägsta betyget som någon fått i kursen.
    
    Här får användaren se en lista med alla ämnen i databasen, snittbetyget samt det högsta och lägsta betyget för varje ämne.
    
    Tips: För att få ut ett medelvärde för betyg med bokstäver kan du behöva omvandla värdena till siffror.
    
- [x]  Lägga till nya elever.
    
    Användaren får möjlighet att mata in uppgifter om en ny elev och den datan sparas då ner i databasen.

### Extrautmaningar

- Kontrollera att personnumren är giltiga genom SQL.
- Bygg en view för att hämta betyg som satts den senaste månaden.
- Bygg ytterligare en funktion för användaren där det går att få fram snittbetyget baserat dels på kön och dels på åldersgrupp/årskull sett till snittet för alla ämnen de läst.