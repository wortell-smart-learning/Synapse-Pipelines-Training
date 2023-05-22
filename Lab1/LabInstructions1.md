# Lab 1 - De Azure omgeving prepareren

*Vereisten*

Om aan deze training te beginnen is het belangrijk dat je een eigen Azure-omgeving hebt met voldoende rechten om Azure Data Factory en bijbehorende resources te kunnen inrichten.

*Doel*

Gedurende de training heb je een werkende omgeving nodig om **hands-on** aan de slag te kunnen gaan met de Azure Data Factory.

In deze reeks opdrachten wordt de omgeving ingericht, zet je de data klaar en richt je de database in. Volg de opdrachten stap voor stap.

## Opdracht 1 - Azure services uitrollen

1. Klink op de onderstaande **deploy to azure** knop. Mocht je de handout fysiek hebben ontvangen, ga naar de Github repo aangegeven door de trainer.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fvstrien%2FADF-Training%2Fmain%2FLab1%2FLabEnvironment%2Fazuredeploy.json)

2. In het deployscherm zijn alle vereisten velden al voorzien van waardes. Je dient alleen zelf een resourcegroup aan te maken door op de **create new** te klikken. Vul hier een naam in en klik vervolgens op OK. 

> Een *best practice* is om de naam van een resourcegroup te laten beginnen met `rg-` gevolgd door een omschrijvende naam en eindigend met een `-omgeving`. 
>
> * Praktijkvoorbeeld:* `rg-dataplatform-dev`
> * Trainingsvoorbeeld:* `rg-adf-training`
>

3. Klik op de knop **Review + Create**. De code wordt vervolgens gevalideerd. Als de validatie geslaagd is wordt dit aangegeven door een groene balk en wordt de knop **Create**  beschikbaar. Klik op de knop en de uitrol van de omgeving zal starten. Mocht er iets fout gaan gedurende de uitrol, laat dit weten aan de trainer.

4. Als de uitrol voltooid is krijg je daar een melding van en hoera! Jouw omgeving is klaar voor gebruik! 

## Opdracht 2 - Data klaar zetten deel 1

1. In de Github map van Lab1 vind je de map [LabEnvironment](https://github.com/wortell-smart-learning/ADF-Training/tree/main/Lab1/LabEnvironment). Hierin:
   * Een SQL-bestand voor de database
   * Twee CSV-bestanden genaamd **SalesPersonal.csv** en **ProductCategoryDiscount.csv**
1. Download met behulp van de volgende link het Zip-bestand voor de gehele repository: [Download ZIP](https://github.com/wortell-smart-learning/ADF-Training/archive/refs/heads/main.zip)
1. Beide bestanden zouden nu je lokaal hebben staan, dit staat waarschijnlijk in de downloads folder.
1. Ga terug naar de Azure Portal, en zoek in jouw resourcegroup naar de **Virtual Machine** en klik deze vervolgens aan.
1. In de horizontale navigatiebalk zie je een aantal opties zoals:
   * Connect
   * Start
   * Stop
   * Capture
   * Delete
   * etc
1. Start de VM indien deze nog niet gestart is
1. Klik op **Connect** en kies **RDP**.
1. Je wordt nu naar een nieuw scherm gebracht en de vereisten velden staan al ingevuld voor je. Klik vervolgens op **Download RDP File**.
1. Wanneer de download klaar is klik je het RDP-bestand aan en klik vervolgens op **Connect**. Er zal een nieuw scherm komen welke vraagt om een gebruikersnaam en wachtwoord, vul de onderstaande gegevens in:
   * *Gebruikersnaam:* `sqladmin`
   * *Wachtwoord:* `WortellSmartLearning.nl`  
   **De kans is aanwezig dat Windows probeert in te loggen met je domein-account (het account van jouw eigen organisatie). Kies in dat geval voor **more choices** --> **Use a different account**:  
   ![Login via RDP](./img/win-login.gif)
1. Wanneer je de gegevens hebt ingevuld, klik op OK.
1. Er kan een nieuw scherm komen om het certificaat te vertrouwen, klik vervolgens op **Yes**.
1. Er wordt nu een verbinding tot stand gebracht met jouw Virtual Machine. Dit kan even duren en er is een kans dat er een scherm komt met sliders om bepaalde zaken te accepteren. Zet alles op **No** en klik **Accept**.
1. Het bureablad van de Virtual Machine wordt geladen. Navigeer na het laden van het bureaublad naar de werkblak en klik op **File explorer** (Het gele mapje). Klik vervolgens op **This PC** gevolgt door te klikken op **Temporary Storage(D:)**.
1. Kopieer het gedownloade bestand genaamd **SalesPersonal.csv** en plak deze in op de D-schijf van de Virtual Machine.
   * Momenteel hoef je hier niets mee te doen
   * Minimaliseer het scherm, later vandaag heb je de Virtual Machine nog nodig.


## Opdracht 3 - Data klaar zetten deel 2

14. Ga terug naar de Azure portal (portal.azure.com) en zoek binnen je resourcegroup naar het **Storage Account** en klik deze aan.
14. In de Blade (Navigatiebalk aan de linkerkant) vind je onder het kopje **Data storage** de optie **Containers**, klik deze aan.
14. Je zult zien dat er al een container is genaamd **data**, klik deze aan. De container is nog leeg en deze gaan wij vullen met het overgebleven bestand genaamd **ProductCategoryDiscount.csv**.
14. In de horizontale navigatiebalk zie je een aantal opties zoals:
    * Upload
    * Change access level
    * refresh
14. Klik op **Upload**, klik op **browse for files** en selecteer het bestaand genaamd **ProductCategoryDiscount.csv** of sleep het bestand vanuit explorer naar het drag 'n drop gebied in de portal en klik vervolgens op de **Upload** knop.
14. Het bestand wordt geupload en zou binnen enkele seconden in de container verschijnen.


## Opdracht 4 - Database inrichten

20. Ga terug naar je resourcegroup. In de lijst zie je 2 databases (sqldb-source en sqldb-target) en 1 server. De sqldb-source is al ingericht en voorzien van data (AdventureWorksLT).
20. Klik de **sqldb-target** database aan en vervolgens in de Blade op **Query editor (preview)**.
    * De loginnaam van het sqladmin-account zou al ingevuld staan, voer vervolgens het wachtwoord in. Dit is hetzelfde wachtwoord als in Opdracht 2.
20. Wanneer je ingelogd bent, zie je een query-interface voor je en de tabbellen, views en stored procedure mappen aan de linkerkant.
20. Ga terug naar de Github map van Lab1 en in de map **LabEnvironment**. Klik vervoglens op het .sql bestand genaamd **Target-Database.sql**. De code zou nu zichtbaar worden, selecteer alle code en plak deze in de Query editor en klik vervolgens op de knop **Run**.
20. Wanneer de query is uitgevoerd, is jouw database klaar voor gebruik!

## Inhoudsopgave

1. [De Azure omgeving prepareren](../Lab1/LabInstructions1.md)
2. [Integration Runtimes](../Lab2/LabInstructions2.md)
3. [Linked Services](../Lab3/LabInstructions3.md)
4. [Datasets](../Lab4/LabInstructions4.md)
5. [Pipelines](../Lab5/LabInstructions5.md)
6. [Triggers](../Lab6/LabInstructions6.md)
7. [Global Parameters](../Lab7/LabInstructions7.md)
8. [Activities](../Lab8/LabInstructions8.md)
9. [Batching en DIUs](../Lab9/LabInstructions9.md)
