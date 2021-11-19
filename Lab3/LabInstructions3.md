# Lab3 - Linked Services

*Vereisten*

Om de lab te kunnen starten is het van belang dat Lab2 is afgerond.

*Doel*

Om data over de zojuist aangemaakte IRs te laten verlopen moeten er connecties met de betreffende diensten gemaakt worden. Gedurende de Lab zullen we meerdere connecties leggen. Volg de opdrachten stap voor stap.

## Opdracht 1 - Azure Key Vault

1. Ga terug naar de **niet** linked ADF. Klik vervolgens weer op Manage. Je komt nu automatisch in het scherm voor de **Linked Services**.

2. klik op **New**, en zoek naar **Key vault**. Klik de **Azure Key vault** aan.

3. Geef de Linked services een duidelijke naam. De best practise is om te beginnen met LS_, de naam van de dienst in je resourcegroup en eindigend met _omgeving.

    *Praktijkvoorbeeld:* LS_KV_Dataplatform_PRD

    *Trainingsvoorbeeld:* LS_kv_sproty7tvzbsw_Training
    
    Helaas mogen - (minteken) niet gebruikt worden, wel mogen _ (Underscorers).

4. Kies bij **Azure Subscription** de subsctiptie van de Azure Pass.

5. Kies bij **Azure Key vault Name** de key vault uit jouw resourcegroup.

6. Klik vervolgens op **Create**.

7. De Linked Service naar de Azure Key Vault is nu aangemaakt, maar deze is nog niet gepubliseerd. Klik op de **Blauze knop** met de tekst **Publish all** en vervolgens op de knop **Publish**. Door te publishen komen jouw aanpassingen **Live** te staan, en kan het gebruikt worden.


## Opdracht 2 - Databases

1. Nu de Azure Key Vault is aangemaakt kunnen wij deze gebruiken om beveiligde connecties te maken met de databases. klik op **New**, en zoek naar **SQL**. Klik de **Azure SQL Databases** aan.

2. Geef de Linked services een duidelijke naam.

3. Kies bij **Connect via integration runtime** de eigen gemaakte **Auto Resolve IR**.

4. Kies bij de **Server Name** de Server naam in zoals deze in je resourcegroup staat.

5. Kies bij de **Database Name** de source Database naam in zoals deze in je resourcegroup staat. De source database begint met **sqldb-source-** als naam.

6. Vul bij de **User Name** het SQL admin account in genaamd: **sqladmin**.

7. Bij de optie tussen **Password** en **Azure Key Vault**, kies de Key vault.

8. Kies bij **AKV linked service** de eerder aangemaakte Key Vault Linked Service.

9. Kies bij **Secret Name** de optie **sqladmin**

10. Klik op de knop **Test Connection** om te valideren dat de verbinding tot stand gebracht kan worden. Gaat dit fout, laat het weten aan de trainer.

11. Als test klaar is en een **Groen bolletje** geeft, kan de Linked Service aangemaakt worden door op **Create** te klikken.

12. Doe Opdracht 2 nogmaals, maar nu voor de **sqldb-target** Database.


## Opdracht 3 - Storage Account

1. klik op **New**, en zoek naar **storage**. Klik de **Azure Blob Storage** aan.

2. Geef de Linked services een duidelijke naam.

3. Kies bij **Connect via integration runtime** de eigen gemaakte **Auto Resolve IR**.

4. Kies bij **Storage account name** het storage account zoals deze in je resourcegroup staat.

5. Klik op de knop **Test Connection** om te valideren dat de verbinding tot stand gebracht kan worden. Gaat dit fout, laat het weten aan de trainer.

6. Als test klaar is en een **Groen bolletje** geeft, kan de Linked Service aangemaakt worden door op **Create** te klikken.


## Opdracht 4 - File system

1. klik op **New**, en zoek naar **file**. Klik de **File system** aan.

2. Geef de Linked services een duidelijke naam.

3. Kies bij **Connect via integration runtime** de **Self-Hosted IR**

4. Vul bij **Host** het **D:\\**

5. Vul bij de **User Name** het SQL admin account in genaamd: **sqladmin**.

6. Bij de optie tussen **Password** en **Azure Key Vault**, kies de Key vault.

7. Kies bij **AKV linked service** de eerder aangemaakte Key Vault Linked Service.

8. Kies bij **Secret Name** de optie **sqladmin**

9. Klik op de knop **Test Connection** om te valideren dat de verbinding tot stand gebracht kan worden. Gaat dit fout, laat het weten aan de trainer.

10. Als test klaar is en een **Groen bolletje** geeft, kan de Linked Service aangemaakt worden door op **Create** te klikken.

### Einde Lab3