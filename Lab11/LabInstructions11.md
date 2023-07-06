# Lab 11: Data Integration Flow

In the previous lab, we set the context for a "simple" (in terms of structure) data flow. We will now use this knowledge to integrate multiple sources.
We will now work with a slightly larger database, taking a more typical Lakehouse approach.

For this data integration flow, you will need to bring together several components:

* Ingestion of a source database to the Data Lake
  * server: `wortellsmartlearning.database.windows.net`
  * login: `student`
  * password: `WortellSmartLearning.nl`
  * database: `AdventureWorks2019`
  * place this data in the `ingest` container
* Loading from the Data Lake to a SQL Database serving as a DW (`target`)
  * To start: only dim_product. Combine this based on three underlying tables that you have in the Data Lake (see table below)
  * Make sure a new *dimension key* is generated (`Dim_Product_ID`). Rename the original key to `ProductAlternateKey`

| Table in DW | Underlying tables               |
|-------------|---------------------------------|
| Dim_Product | production.ProductCategory      |
|             | production.ProductSubcategory   |
|             | production.Product              |

* As a follow-up: also load fact_sale. This is based on `sales.SalesOrderDetail` combined with `sales.SalesOrderHeader`
  * Ensure an extra column comes with a reference to `Dim_Product_Id`, and that it is correctly filled for each row
  * Only include useful columns (rule of thumb: measurement values, dates, and references to dimensions)

## Table of Contents

1. [Preparing the Azure environment](../Lab1/LabInstructions1.md)
2. [Integration Runtimes](../Lab2/LabInstructions2.md)
3. [Linked Services](../Lab3/LabInstructions3.md)
4. [Datasets](../Lab4/LabInstructions4.md)
5. [Pipelines](../Lab5/LabInstructions5.md)
6. [Triggers](../Lab6/LabInstructions6.md)
7. [Global Parameters](../Lab7/LabInstructions7.md)
8. [Activities](../Lab8/LabInstructions8.md)
9. [Batching and DIUs](../Lab9/LabInstructions9.md)
10. [First Data Flows](../Lab10/LabInstructions10.md)
11. [Data integration flows](../Lab11/LabInstructions11.md)