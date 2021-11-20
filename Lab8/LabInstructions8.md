# Lab8 - Activities

*Vereisten*

Om de lab te kunnen starten is het van belang dat Lab5 is afgerond.

*Doel*

We hebben al enkele activities gebruikt zoals Copy, Web, Wait en Set variable. Er zijn er nog veel meer en sommige zijn heel handig als je deze met elkaar laten samenwerken om zodoende geavanceerde pipelines te creeeren. Volg de opdrachten stap voor stap.

## Opdracht 1 - Stored Procedure uitvoeren.

1. Zorg dat je weer terug bent in de **niet** linked ADF. Klik bij Pipelines op **Pipeline Action** en op **New Pipeline**.

2. Noem de pipeline: **PL_Process_Dates_Training**.

3. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Stored Procedure** op het canvas.

4. Noem de **Stored Procedure** als volgt: **USP_DL_Dates**. Klik vervoglens op de tab **Settings**.

5. Kies bij **Linked service** voor de **LS_sqldb_target** en bij **Stored Procedure name** de **[Stg].[USP_DL_Dates]**.

6. Klik op **Stored procedure parameters** en vervoglens op **import**. De parameters van de stored procedure worden nu ingeladen.

7. Vul bij **StartYear** het volgende in: **1900**.

8. Vul bij **EndYear** het volgende in: **2099**.

9. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

10. Klik op **Debug** en wacht tot de pipeline klaar is.


## Opdracht 2 - Conditioneel filteren

1. Klik bij Datasets op **Dataset Action** en op **New Dataset**.

2. Zoek op **SQL** en kies **Azure SQL Database**. Klik vervolgens op **Continue**.

3. Noem de Dataset als volgt: **DS_asql_SalesLT_Customers_Training** en kies als linked service de **LS_sqldb_source**.

4. Kies bij **Table** voor **SalesLT.Customer** en klik op **OK**.

5. Klik bij Pipelines op **Pipeline Action** en op **New Pipeline**.

6. Noem de pipeline: **PL_Filter_SalesPersonal_Training**.

7. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Loopup** op het canvas.

8. Noem de lookup: **Lookup_SalesPersonal**.

9. Ga naar de tab **Settings** en kies bij **Source dataset** de **DS_asql_Stg_Customers_Training**.

10. Zet het vinkje uit bij **First row only**.

11. Klik bij **Use query** op de optie **query** en type/plak de volgende code: 

    SELECT
    COUNT(*) AS Registered_Customers,
    SalesPerson

    FROM [SalesLT].[Customer]

    GROUP BY SalesPerson

12. Uit de lijst met **Activities**, klik op de optie **Iteration & conditionals**. Klik en sleep **filter** op het canvas.

13. Geef de **filter** de naam **Best seller**.

14. klik op de tab **Settings** en klik bij **Items** op het veld er naast en vervolgens op **Add dynamic content**.

15. Plak/ type de volgende code: **@activity('Lookup_SalesPersonal').output.value** en klik op **OK**.

16. Klik bij **Condition** op het veld er naast en vervolgens op **Add dynamic content**.

17. Type/ plak de volgende code: **@greaterOrEquals(item().Registered_Customers,100)**.

18. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

19. Klik op **Debug** en wacht tot de pipeline klaar is, bekijk de resultaten door op de **Output** van de **Best seller** stap te kijken.


## Opdracht 3 - Inserten in een Stored Procedure

1. Klik bij Datasets op **Dataset Action** en op **New Dataset**.

2. Zoek op **SQL** en kies **Azure SQL Database**. Klik vervolgens op **Continue**.

3. Noem de Dataset als volgt: **DS_asql_SalesLT_SalesOrderHeader_Training** en kies als linked service de **LS_sqldb_source**.

4. Kies bij **Table name** voor de tabel **SalesLT.SalesOrderHeader** en klik op **OK**.

5. Houd je muis op de **DS_asql_SalesLT_SalesOrderHeader_Training** en klik op de **3 bolletjes er achter** (Actions). 

6. Klik vervolgens op de optie **Clone**, een kopie van de Dataset zal verschijnen.

7. Hernoem deze Dataset naar **DS_asql_Stg_SalesOrderHeader_Training** en pas de linked service aan naar **LS_sqldb_target**.

8. Klik bij **Table** op **Edit** en klik in het 2e vlak type/ plak **DeltaTable** en klik op **OK**.

9. Klik bij Pipelines op **Pipeline Action** en op **New Pipeline**.

10. Noem de Pipeline als volgt: **PL_copy_Deltaload_SalesOrderHeader_Training**.

11. Uit de lijst met **Activities**, klik op de optie **Move & transform**. Klik en sleep **Copy Data** op het canvas.

12. Geef de **Copy data** de volgende naam: **Copy SalesOrderHeader** en klik vervolgens op de tab **Source** en kies voor de **Source dataset** de **DS_asql_SalesLT_SalesOrderHeader_Training**.

13. Klik op de tab **Sink** en kies voor de **Sink dataset** de **DS_asql_Stg_SalesOrderHeader_Training**.

14. Vul bij **Pre-copy Script** de volgende code in: **Truncate table [Stg].[SalesOrderHeader]**.

15. Kies bij **Stored Procedure name** voor **[Stg].[USP_DL_SalesOrderHeader]**.

16. Pas de **Table type** aan naar **[Stg].[UDT_SalesOrderHeader]**

17. zorg ervoor dat de **Table type parameter name** staat op **Deltatable**.

18. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

19. Klik op **Debug** en wacht tot de pipeline klaar is.


## Opdracht 4 - Dynamische pipelines/ Datasets

1. Klik bij Datasets op **Dataset Action** en op **New Dataset**.

2. Zoek op **SQL** en kies **Azure SQL Database**. Klik vervolgens op **Continue**.

3. Noem de Dataset als volgt: **DS_asql_sqldb_SourceTables_Training** en kies als linked service de **LS_sqldb_source**.

4. Laat de **Table name** leeg en klik op **OK**.

5. Herhaal stap 1 t/m 4 voor de **sqldb-target** en noem de Dataset als volgt: **DS_asql_sqldb_TargetTables_training**.

6. Wanneer de Dataset voor de **sqldb-target** is aangemaakt, ga naar de tab **Parameters** en klik op **New**.

7. Geef de parameter de volgende naam: **TargetTableNames**.

8. Ga naar de tab **Connection** en vink **Edit** aan. Vul in het eerste veld **Stg** in en klik op het 2e veld en vervolgens op **Add dynamic content**.

9. Kies uit de lijst de parameter genaamd: **TargetTableName** en klik vervolgens op **OK**.

10. Klik bij Pipelines op **Pipeline Action** en op **New Pipeline**.

11. Noem de Pipeline als volgt: **PL_copy_deltaload_Training**.

12. Maak een nieuwe parameter aan door op **New** te klikken en noem deze **Tablelist**. Kies als **Type** voor **Array**.

13. Uit de lijst met **Activities**, klik op de optie **General**. Klik en sleep **Lookup** op het canvas.

14. Geef de **lookup** de volgende naam: **Lookup_SourceTables**, klik vervolgens op de **Settings** tab en kies bij **Source dataset** de **DS_aaqsl_sqldb_SourceTables_training**.

15. Klik bij **Use query** de optie **Query** aan. Klik vervolgens in het query veld en plak/ type de volgende query:

    SELECT 
    TABLE_SCHEMA AS Table_Schema,
    TABLE_NAME AS Table_Name
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'SalesLT' AND TABLE_TYPE = 'BASE TABLE'

    Indien **First row only** staat aangevinkt, zet deze uit.

16. Uit de lijst met **Activities**, klik op de optie **Iteration & Conditionals**. Klik en sleep **ForEach** op het canvas.

17. Sleep het **Groene blokje** van **Lookup_SourceTables** naar de **ForEach** zodat deze opeenvolgend aan elkaar zijn verbonden.

18. Geef de **ForEach** de volgende naam: **ForEachTable** en klik op de tab **Settings**.

19. Klik op het vlak naast **Items** en vervolgens op **Add dynamic content**. Klik de Activity outputs **Activity outputs** aan en klik vervolgens op **OK**.

20. klik op het **potloodje** in de **ForEachTable** en uit de lijst met **Activities**, klik op de optie **Move & transform**. Klik en sleep **Copy Data** op het canvas.

21. Geef de **Copy data** de volgende naam: **Copy Tables** en klik vervolgens op de tab **Source** en kies voor de **Source dataset** de **DS_aqsl_sqldb_SourceTables_training**.

22. Klik bij **Use query** de optie **Query** aan. Klik vervolgens in het query veld en vervolgens op **Add dynamic content** en type/ plak:

    SELECT * FROM @{item().Table_Schema}.@{item().Table_Name}

23. Klik op de tab **Sink** en daarna op het veld naast **TargetTableName** gevolgd door **Add dynamic content** en plak/ type: 
    
    @item().Table_Name

24. Klik op het veld naast **Pre-copy script** en vervolgens op **Add dynamic content** en plak/ type: 

    Truncate Table Stg.@{item().Table_Name}

25. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**.

26. Klik op **Debug** en wacht tot de pipeline klaar is.

### Einde Lab8

