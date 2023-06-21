# Lab 8 - Batching en DIUs

*Vereisten*

Om het lab te kunnen starten is het van belang dat Lab6 is afgerond.

*Doel*

We willen ook de data integratie vormgeven met behulp van Data Flows. Inmiddels hebben we redelijk wat van Azure Data Factory / Synapse Pipelines gezien - de opdrachten zijn daarom nu meer hoogover!

Bij deze opdracht wordt verwacht dat je de AdventureWorkLT-database hebt geëxporteerd naar parquet-bestanden. Dat kun je uiteraard zelf doen (met de ervaring van lab 6), of je kunt de bestanden handmatig uploaden - ze staan hier:

* [Address.parquet](parquetfiles/Address.parquet)
* [Customer.parquet](parquetfiles/Customer.parquet)
* [CustomerAddress.parquet](parquetfiles/CustomerAddress.parquet)
* [Product.parquet](parquetfiles/Product.parquet)
* [ProductCategory.parquet](parquetfiles/ProductCategory.parquet)
* [ProductDescription.parquet](parquetfiles/ProductDescription.parquet)
* [ProductModel.parquet](parquetfiles/ProductModel.parquet)
* [ProductModelProductDescription.parquet](parquetfiles/ProductModelProductDescription.parquet)
* [SlaesOrderDetail.parquet](parquetfiles/SlaesOrderDetail.parquet)
* [SalesOrderHeader.parquet](parquetfiles/SalesOrderHeader.parquet)

# Opdracht: Eenvoudige dataflow

In dit lab gaan we de Data Flow functionaliteit van Azure Data Factory zelf ervaren. Het doel is met name om alle componenten om de Data Flow heen een keer goed op het netvlies te hebben.

Zorg er daarom voor dat de volgende zaken ingericht worden:

* Een nieuwe Data Flow, met daarin:
  * Als source: het bestand `Product.parquet` op je Data Lake (container `stg`, map `awlt`)
  * Er moet een extra kolom met ranking bijkomen, waarin aangegeven wordt welke productcategorie in totaal de meeste producten heeft.
    * Als productcategorie volstaat voor nu `ProductCategoryID` (er hoeft geen koppeling gemaakt naar tabel ProductCategory)
    * Maak het jezelf niet te moeilijk, denk in kleine stapjes (hint: wat moet je weten voordat je de ranking kunt doen?)
    * Gebruik de Data preview om te kijken of je in de goede richting werkt.
  * Alleen de producten in de grootste drie productcategorieën moeten weggeschreven worden
    * Schrijf het resultaat weg op twee plaatsen:
      * In je Data Lake (container `datalake`, map `bronze/analysis`, bestand `productcategories.parquet`)
      * In je SQL Database (`target`). Laat een tabel aan met de naam `dbo.product_verrijkt` aanmaken door je **Sink** destination.
* Maak een bijbehorende pipeline die deze Data Flow ook uitvoert
* Publiceer alle resources, en test de pipeline

