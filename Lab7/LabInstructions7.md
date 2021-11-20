# Lab7 - Global Parameters

*Vereisten*

Om de lab te kunnen starten is het van belang dat Lab5 is afgerond en dat de Virtual Machine opgestart is en de IR draait.

*Doel*

Gisteren hebben wij van A tot Z de ADF ingericht en pipelines gedraait. Zoals in Lab2 aangegeven kan het voorkomen dat een ander team ook een ADF heeft en kan het ook voorkomen dat er een afhankelijk bestaat tussen beide ADFs of naar andere diensten.  In de lab gaan we hiermee aan de slag.

## Opdracht 1 - Globale parameters

1. Ga naar de ADF (adf.azure.com) en kies voor de **Niet** linked ADF.

2. Klik links op de **gereedschapskist** (Manage). Klik vervolgens aan de linkerkant op **Global parameters**. 

3. Klik op **New**, een nieuw scherm zal naar voren komen. Vul bij **Name** het volgende in: **SubscriptionID** en bij **Value** je subscriptionID. Deze kan je vinden in de URL van de ADF.

*Voorbeeld:* https://adf.azure.com/en-us/management/globalparameters?factory=%2Fsubscriptions%2Ffae3cd10-ede1-4e32-b796-362b72f8e236%2FresourceGroups%2Frg-adf-training%2F

Het is van belang om de %2F niet mee te kopieeren. Gebaseerd op het voorbeeld zou de SubscriptieID het volgende zijn: **fae3cd10-ede1-4e32-b796-362b72f8e236**

4. Herhaal stap 3, maar maak nu een Global parameter aan genaamd: **Resourcegroup** met als **Value** de resourcegroup naam, deze kan je ook uit de URL kopieeren. 

5. Herhaal stap 3, maar maak nu een Global parameter aan genaamd: **DataFactory** met als **Value** de naam van de adf-linked, deze kan je vinden in je resourcegroup.

6. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.


## Opdracht 2 - API caller

1. Klik links op het **Potloodje** (Author) en maak een nieuwe pipeline aan.

2. Geef de pipeline een duidelijke naam.

3. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Web** op het canvas.

4. Geef het **Web blokje** een duidelijke naam en klik vervolgens op de tab **Settings**.

5. Klik op veld naast **URL** en vervolgens op **Add dynamic content**.

6. Plak/ Type de volgende code in de het veld: **https://management.azure.com/subscriptions/@{pipeline().globalParameters.SubscriptionID}/resourceGroups/@{pipeline().globalParameters.Resourcegroup}/providers/Microsoft.DataFactory/factories/@{pipeline().globalParameters.DataFactory}/pipelines/pl_wait/createRun?api-version=2018-06-01**

7. Kies bij **Methode** voor **POST**. Klik bij **Headers** op **New** en vul bij **name** het volgende in: **Content-Type** en bij **value**: **application/json**.

8. Vul in het veld naast **body** het volgende in: **{}**.

9. Kies bij **Integration runtime** de eigen genaamkte AutoResolve-IR.

10. Kies bij **Authentication** voor **Managed Identity** en vul bij **Resource** het volgende in: **https://management.core.windows.net/**.

11. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.


## Opdracht 3 - Linked ADF pipeline

1. Rechtboven in beeld, zie je een rij met iconen. Klik op de 2e van links, het icoon met **de 2 schermen en pijljes** (Switch Data Factory).

2. Er zal een nieuw scherm verschijnen, en het meeste zal al van te voren zijn ingevuld. Kies bij **Data Factory Name** de adf-Linked en klik vervolgens op **OK**.

3. Maak een nieuwe pipeline aan genaamd: **PL_wait**.

4. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Wait** op het canvas.

5. Geef het **Wait blokje** een duidelijke naam.

6. Klik vervolgens op de tab **Settings** en pas de **Wait time in seconds** aan naar 10.

7. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

8. Switch op dezelfde manier als stap 1 en 2 weer terug naar de **niet** linked adf.

9. Klik op de pipeline die je in Opdracht 2 hebt gemaakt, klik vervolgens op **Debug**.

10. Wanneer de pipeline is voltooid, switch via stap 1 en 2 terug naar de adf-linked.

11. Klik aan de linkerkant op het **Radartje** (Monitor). Je komt nu meteen bij **Pipeline runs** uit en zou de **PL_wait** tussen de lijst van uitgevoerde pipelines dienen te staan.

### Einde Lab7

