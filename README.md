# DB-labb-3

# Vad du ska göra

- [ ]  Fyll på din databas från labb 2 med lite mer exempeldata i alla tabeller.
- [ ]  Skapa ett nytt console-program i C#
- [ ]  Skapa en enkel navigation i programmet som gör att användaren kan välja mellan följande funktioner.


## Via Entity framework : Console

- [x]  Hämta alla elever.
    
    Användaren får välja om de vill se eleverna sorterade på för- eller efternamn och om det ska vara stigande eller fallande sortering.
    
- [x]  Hämta alla elever i en viss klass.
    
    Användaren ska först få se en lista med alla klasser som finns, sedan får användaren välja en av klasserna och då skrivs alla elever i den klassen ut.
    
    Extra utmaning: låt användaren även få välja sortering på eleverna som i punkten ovan.
    
- [ ]  Lägga till ny personal (ska lösas genom Entity framework)
    
    Användaren ska få möjlighet att mata in uppgifter om en ny anställd och den datan sparas då ner i databasen.

## Via SQL : Azure Data Studio (Query-fil eller notebook-fil)

- [ ]  Hämta personal
    
    Användaren får välja om denna vill se alla anställda, eller bara inom en av kategorierna så som ex lärare.
    
- [ ]  Hämta alla betyg som satts den senaste månaden
    
    Här får användaren se en lista med alla betyg som satts senaste månaden där elevens namn, ämnet och betyget framgår.
    
- [ ]  Hämta en lista med alla ämnen och det snittbetyg som eleverna fått i det ämnet samt det högsta och lägsta betyget som någon fått i kursen.
    
    Här får användaren se en lista med alla ämnen i databasen, snittbetyget samt det högsta och lägsta betyget för varje ämne.
    
    Tips: För att få ut ett medelvärde för betyg med bokstäver kan du behöva omvandla värdena till siffror.
    
- [ ]  Lägga till nya elever.
    
    Användaren får möjlighet att mata in uppgifter om en ny elev och den datan sparas då ner i databasen.

## Extrautmaningar

- Kontrollera att personnumren är giltiga genom SQL.
- Bygg en view för att hämta betyg som satts den senaste månaden.
- Bygg ytterligare en funktion för användaren där det går att få fram snittbetyget baserat dels på kön och dels på åldersgrupp/årskull sett till snittet för alla ämnen de läst.