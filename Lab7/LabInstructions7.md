# Lab 7 - Global Parameters

*Vereisten*

Om het lab te kunnen starten is het van belang dat Lab5 is afgerond en dat de Virtual Machine opgestart is en de IR draait.

*Doel*

Gisteren hebben wij van A tot Z de ADF ingericht en pipelines gedraaid. Zoals in Lab2 aangegeven kan het voorkomen dat een ander team ook een ADF heeft en kan het ook voorkomen dat er een afhankelijkheid bestaat tussen beide ADFs of naar andere diensten.  In het lab gaan we hiermee aan de slag, door met behulp van een API-call de pipeline in adf-linked uit te voeren.

Volg de opdrachten stap voor stap.

## Opdracht 1 - Globale parameters

1. Ga naar de ADF (adf.azure.com) en kies voor de **Niet** linked ADF.

2. Klik links op de **gereedschapskist** (Manage). Klik vervolgens aan de linkerkant op **Global parameters**. 

3. Klik op **New**, een nieuw scherm zal naar voren komen. Vul bij **Name** het volgende in: **SubscriptionID** en bij **Value** je subscriptionID. Deze kan je vinden in de URL van de ADF. 
   Voorbeeld: `https://adf.azure.com/en-us/management/globalparameters?factory=%2Fsubscriptions%2Ffae3cd10-ede1-4e32-b796-362b72f8e236%2FresourceGroups%2Frg-adf-training%2F`

   Het is van belang om de %2F niet mee te kopieeren. Gebaseerd op het voorbeeld zou de SubscriptieID het volgende zijn: **fae3cd10-ede1-4e32-b796-362b72f8e236**

4. Herhaal stap 3, maar maak nu een Global parameter aan genaamd: **Resourcegroup** met als **Value** de resourcegroup naam, deze kan je ook uit de URL kopiëren. 

5. Herhaal stap 3, maar maak nu een Global parameter aan genaamd: **DataFactory** met als **Value** de naam van de adf-linked, deze kan je vinden in je resourcegroup.

6. Herhaal stap 3, maar maak nu een Global parameter aan genaamd: **Pipeline** met als **Value** de naam van de pipeline in de adf-linked, `PL_Wait`.

7. Klik op de **Blauwe knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

We hebben nu vier parameters aangemaakt op *factory*-niveau. Dit zijn globale constanten die in de hele Data Factory gebruikt kunnen worden. Op deze manier kun je instellingen eenvoudig centraal beheren.

## Opdracht 2 - API caller

1. Klik links op het **Potloodje** (Author) en maak een nieuwe pipeline aan.

2. Geef de pipeline een duidelijke naam.

3. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Web** op het canvas.

4. Geef het **Web blokje** een duidelijke naam en klik vervolgens op de tab **Settings**.

5. Klik op veld naast **URL** en vervolgens op **Add dynamic content**.

6. Plak of type de volgende code in de het veld:
   `https://management.azure.com/subscriptions/@{pipeline().globalParameters.SubscriptionID}/resourceGroups/@{pipeline().globalParameters.Resourcegroup}/providers/Microsoft.DataFactory/factories/@{pipeline().globalParameters.DataFactory}/pipelines/@{pipeline().globalParameters.Pipeline}/createRun?api-version=2018-06-01`

   > Wil je meer weten over de mogelijkheden van de Data factory REST API, dan kun je die in de [Microsoft documentatie](https://docs.microsoft.com/nl-nl/rest/api/datafactory/pipelines) teruglezen.

7. Kies bij **Methode** voor **POST**.

8. Vul in het veld naast **body** het volgende in: **{}**.

9. Kies bij **Authentication** voor **System Assigned Managed Identity** en vul bij **Resource** het volgende in: `https://management.core.windows.net/`.

10. Klik bij **Headers** op **New** en vul bij **name** het volgende in: **Content-Type** en bij **value**: **application/json**.

11. Kies onder **Advanced** bij **Integration runtime** de eigen genaamkte **Azure IR**.


12. Klik op de **Blauwe knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.


## Opdracht 3 - Linked ADF pipeline

1. Rechtboven in beeld, zie je een rij met iconen. Klik op de 2e van links, het icoon met **de 2 schermen en pijljes** (Switch Data Factory).

2. Er zal een nieuw scherm verschijnen, en het meeste zal al van te voren zijn ingevuld. Kies bij **Data Factory Name** de adf-Linked en klik vervolgens op **OK**.

3. Maak een nieuwe pipeline aan genaamd: `PL_Wait`.

4. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Wait** op het canvas.

5. Geef het **Wait blokje** een duidelijke naam.

6. Klik vervolgens op de tab **Settings** en pas de **Wait time in seconds** aan naar 10.

7. Klik op de **Blauwe knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

8. Switch op dezelfde manier als stap 1 en 2 weer terug naar de **niet** linked adf.

9. Klik op de pipeline die je in Opdracht 2 hebt gemaakt, klik vervolgens op **Debug**.

10. Wanneer de pipeline is voltooid, switch via stap 1 en 2 terug naar de adf-linked.

11. Klik aan de linkerkant op **Monitor**. Je komt nu meteen bij **Pipeline runs** uit en zou de `PL_wait` tussen de lijst van uitgevoerde pipelines dienen te staan.

12. Als laatste zou je nog even kunnen kijken naar de doorlooptijd van de twee pipelines (in de linked en de niet-linked factory). Wat valt je op? Hoe zou je dit verklaren?

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
