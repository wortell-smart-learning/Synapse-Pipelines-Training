# Lab1 - De Azure omgeving prepareren

*Vereisten*

Voorafgaand aan de training zou je een zogeheten **Azure Pass** ontvangen hebben van Sigma Data Learning.  
Indien dit niet het geval is kan er nu tijdelijk gebruik gemaakt worden van een gratis voucher, volg de stappen op de pagina om deze te activeren:
https://www.microsoftazurepass.com/Home/HowTo

*Doel*

Gedurende de training hebben we een werkende omgeving nodig om **hand-on** aan de slag te kunnen gaan met de Azure Data Factory.
In deze reeks opdrachten rollen we de omgeving uit, zetten de data klaar en richten wij de database in. Volg de opdrachten stap voor stap.

## Opdracht 1 - Azure services uitrollen

1. Klink op de onderstaande **deploy to azure** knop.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudShiftBV%2FADF-Training%2Fmain%2FLab1%2FLabEnvironment%2Fazuredeploy.json)

2. Je wordt nu gebracht naar het inlogscherm van de Azure Portal en log vervolgens in met het account waar de Azure Pass op is geactiveerd.

3. In het deployscherm zijn alle vereisten velden al voorzien van waardes. Je dient alleen zelf een resourcegroup aan te maken door op de **create new** (of de equivalent in een andere taal) te klikken en vul een naam in en klik vervolgens op OK. De best practise is om een resourcegroup te laten beginnen met rg- gevolgd door een omschrijvende naam en eindigend met een -omgeving. 

*Praktijkvoorbeeld:* rg-dataplatform-dev 

*Trainingsvoorbeeld:* rg-adf-training

4. Klik op de knop **Review + Create** (of de equivalent in een andere taal). De code wordt vervolgens gevalideerd. Als de validatie geslaagd is wordt dit aangegeven door een groene balk en wordt de knop **Create** (of de equivalent in een andere taal) beschikbaar. Klik op de knop en de uitrol van de omgeving zal starten. Mocht er iets fout gaan gedurende de uitrol, laat die weten aan de trainer.

5. Als de uitrol voltooid is krijg je daar een melding van en hoera! Jouw omgeving is klaar voor gebruik! 

## Opdracht 2 - Data klaar zetten deel 1

1. In de Github map van Lab1 vinden wij een map genaamd **LabEnvironment**. Hierin vind je niet alleen de code van de Azure uitrol maar, voor de database en 2 .csv bestanden genaamd **SalesPersonal.csv** en **ProductCategoryDiscount.csv**. Klik op het eerste .csv bestand en klik vervolgens op **Download**. Herhaal deze stap voor het andere bestand.

2. Beide bestanden zouden nu je lokaal hebben staan, dit staat waarschijnelijk in de downloads folder.

3. Ga terug naar de Azure Portal, en zoek in jouw resourcegroup naar de **Virtual Machine** en klik deze vervolgens aan.

4. In de horizontale navigatiebalk zien we een aantal opties zoals: Connect, Start, Stop, Capture, Delete, etc (of de equivalenten in een andere taal). Klik vervolgens op **Connect** en kies **RDP**.

5. Je wordt nu naar een nieuw scherm gebracht en de vereisten velden staan al ingevuld voor je. Klik vervolgens op **Download RDP File**.

6. Wanneer de download klaar is klik je het RDP-bestand aan en klik vervolgens op **Connect**. Er zal een nieuw scherm komen welke vraagt om een gebruikersnaam en wachtwoord, vul de onderstaande gegevens in:

    *Gebruikersnaam:* sqladmin

    *Wachtwoord:* Welkom12345!

    De gebruikersnaam en het wachtwoorden verdienen zeker geen security prijs, maar werken uitstekend voor trainingsdoeleinde. Wanneer je de gegevens hebt ingevuld, klik op OK.

7. Er kan een nieuw scherm komen om het certificaat te vertrouwen, klik vervolgens op **Yes**.

8. Er wordt nu een verbinding tot stand gebracht met jouw Virtual Machine. Dit kan even duren en er is een kans dat er een scherm komt met sliders om bepaalde zaken te accepteren. Zet alles op **NO** en ga verder.

9. Het bureablad van de Virtual Machine wordt geladen. Navigeer na het laden van het bureaublad naar de werkblak en klik op **File explorer** (Het gele mapje). Klik vervolgens op **This PC** gevolgt door te klikken op **Temporary Storage(D:)**.

10. Kopieer het gedownloaden bestand genaamd **SalesPersonal.csv** en plak deze in op de D-schijf van de Virtual Machine. Voor nu zijn we hierop klaar, minimaliseer het scherm, we hebben de Virtual Machine later vandaag nog nodig.


## Opdracht 3 - Data klaar zetten deel 2

1. Ga terug naar de Azure portal (portal.azure.com) en zoek binen je resourcegroup naar het **Storage Account** en klik deze aan.

2. In de Blade (Navigatiebalk aan de linkerkant) vinden we onder het kopje **Data storage** de optie **Containers**, klik deze aan.

3. Je zult zien dat er al een container is genaamd **data**, klik deze aan. De container is nog leeg en deze gaan wij vullen met het overgebleven bestand genaamd **ProductCategoryDiscount.csv**.

4. In de horizontale navigatiebalk zien we een aantal opties zoals: Upload, Change access level, refresh, etc. Klik op **Upload**, klik op de het blauwe mapje en kies vervolgens het bestaand genaamd **ProductCategoryDiscount.csv** en klik vervolgens op de **Upload** knop.

5. Het bestand wordt geupload en zou binnen enkele seconden in de container verschijnen.


## Opdracht 4 - Database inrichten

1. Ga terug naar je resourcegroup. In de lijst zie je 2 databases (sqldb-source en sqldb-target) en 1 server. De sqldb-source is al ingericht en voorzien van data (AdventureWorksLT).
   Klik de **sqldb-target** database aan en vervolgens in de Blade op **Query editor (preview)**.

2. De loginnaam van het sqladmin-account zou al ingevuld staan, voer vervolgens het wachtwoord in. Dit is hetzelfde wachtwoord als in Opdracht 2. 
   Wanneer je ingelogd bent, zie je een query-interface voor je en de tabbellen, views en stored procedure mappen aan de linkerkant. 

3. Ga terug naar de Github map van Lab1 en in de map **LabEnvironment**. Klik vervoglens op het .sql bestand genaamd **Target-Database.sql**. De code zou nu zichtbaar worden, selecteer alle code en plak deze in de Query editor en klik vervolgens op de knop **Run**.

4. Wanneer de query is uitgevoerd, is jouw database klaar voor gebruik!

### **Einde lab1**



