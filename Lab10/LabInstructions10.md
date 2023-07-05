# Lab 10 - First Data Flows

*Goal*

We want to shape data integration using Data Flows. By now we have seen quite a bit of Azure Data Factory / Synapse Pipelines - the assignments are therefore more high-level!

For this assignment, it is expected that you have exported the AdventureWorkLT database to parquet files. You can of course do this yourself, or you can manually upload the files - they are available for download here:

* [Address.parquet](parquetfiles/Address.parquet)
* [Customer.parquet](parquetfiles/Customer.parquet)
* [CustomerAddress.parquet](parquetfiles/CustomerAddress.parquet)
* [Product.parquet](parquetfiles/Product.parquet)
* [ProductCategory.parquet](parquetfiles/ProductCategory.parquet)
* [ProductDescription.parquet](parquetfiles/ProductDescription.parquet)
* [ProductModel.parquet](parquetfiles/ProductModel.parquet)
* [ProductModelProductDescription.parquet](parquetfiles/ProductModelProductDescription.parquet)
* [SalesOrderDetail.parquet](parquetfiles/SalesOrderDetail.parquet)
* [SalesOrderHeader.parquet](parquetfiles/SalesOrderHeader.parquet)

## Preparations

* In your Storage Account that serves as Data Lake, create a container and folder
  * You are free to choose your container and folder names
  * Suggestion for container: `datalake`
* Upload the parquet files in this container.
  * You are again free to choose a location
  * Suggestion for folder: `bronze/awlt/2026-12-24` (or whatever the current date is)

## First step: A Simple Data Flow

In this lab, we will experience the Data Flow functionality of Azure Data Factory ourselves. The main goal is to get a good understanding of all the components surrounding the Data Flow.

* Create a first new Data Flow:
  * Source: the `Product.parquet` file on your Data Lake
  * Transformation:
    * An extra column with ranking should be added, indicating which product category has the most products in total.
    * For product category, `ProductCategoryID` is sufficient for now (no link needs to be made to the ProductCategory table)
    * Don't make it too hard on yourself, think in small steps (hint: what do you need to know before you can do the ranking?)
    * Use the Data preview to see if you're working in the right direction.
  * Only the products in the top three product categories should be written to the sink
    * Write the result in two places:
      * In your Data Lake 
        * once again free to choose your container, folder, and file names.
        * Suggestions:
          * container `datalake`
          * folder `bronze/analysis`
          * file `productcategories.parquet`)
      * In your SQL Database (`target`). Have a table named `dbo.product_enriched` created by your **Sink** destination.
* Create a corresponding pipeline that executes this Data Flow
* Publish all resources, and test the pipeline

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