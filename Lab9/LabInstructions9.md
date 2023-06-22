# Lab 9: Data integratie flow

In het vorige lab hebben we de context neergezet voor een "eenvoudige" (qua structuur) dataflow. We gaan deze kennis nu gebruiken om meerdere bronnen te integreren.
We gaan nu met een iets grotere database aan de slag, waarin we een meer typische Data Warehouse-aanpak nemen.

Je zult voor deze data integratie flow meerdere componenten moeten laten samenkomen:

* ontsluiting van een brondatabase naar het Data Lake
  * server: `wortellsmartlearning.database.windows.net`
  * login: `student`
  * password: `WortellSmartLearning.nl`
  * database: `AdventureWorks2019`
  * zet deze data in de `ingest` container
* Laden van het Data Lake naar het Data Warehouse
  * Als start: alleen dim_product. Combineer deze op basis van drie achterliggende tabellen die je in het Data Lake hebt (zie tabel hieronder)
  * Zorg ervoor dat er een nieuwe *dimensiesleutel* wordt gegenereerd (`Dim_Product_ID`). De oorspronkelijke sleutel hernoem je naar `ProductAlternateKey`

| Tabel in DW | Achterliggende tabellen       |
|-------------|-------------------------------|
| Dim_Product | production.ProductCategory    |
|             | production.ProductSubcategory |
|             | production.Product            |

* Als vervolg: laad ook fact_sale. Deze is gebaseerd op `sales.SalesOrderDetail` gecombineerd met `sales.SalesOrderHeader`
  * Zorg ervoor dat er een extra kolom komt met een verwijzing naar `Dim_Product_Id`, en dat deze voor elke rij correct gevuld is
  * Neem alleen nuttige kolommen mee (vuistregel: meetwaarden, datums en verwijzingen naar dimensies)

## Inhoudsopgave

0. [De Azure omgeving prepareren](../0Prep/LabVoorbereiding0.md)
1. [Integration Runtimes](../Lab1/LabInstructions1.md)
2. [Linked Services](../Lab2/LabInstructions2.md)
3. [Datasets](../Lab3/LabInstructions3.md)
4. [Pipelines](../Lab4/LabInstructions4.md)
5. [Triggers](../Lab5/LabInstructions6.md)
6. [Activities](../Lab6/LabInstructions6.md)
7. [Batching en DIUs](../Lab7/LabInstructions7.md)
8. [Eerste Data Flows](../Lab8/LabInstructions8.md)
9. [Data integratie flows](../Lab9/LabInstructions9.md)