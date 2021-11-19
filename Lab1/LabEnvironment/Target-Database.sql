CREATE SCHEMA [Stg]
GO

CREATE TABLE [Stg].[Dates](
	[Date] [datetime] NOT NULL,        
    [Day] [tinyint] NOT NULL,         
    [DayName] [nvarchar](16) NOT NULL,     
    [Week] [tinyint] NOT NULL,         
    [ISOWeek] [tinyint] NOT NULL,     
    [DayOfWeek] [tinyint] NOT NULL,    
    [Month] [tinyint] NOT NULL,       
    [MonthName] [nvarchar](16) NOT NULL,    
    [Quarter] [tinyint] NOT NULL,       
    [Year] [smallint] NOT NULL,          
    [FirstOfMonth] [datetime] NOT NULL,
    [LastOfYear] [datetime] NOT NULL, 
    [DayOfYear] [smallint] NOT NULL    
)ON [PRIMARY]
GO

CREATE TABLE [Stg].[SalesPersonal](
	[SalesPerson] [nvarchar](256) NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[MiddleName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[Address](
	[AddressID] [int] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[StateProvince] [nvarchar](30) NOT NULL,
	[CountryRegion] [nvarchar](30) NOT NULL,
	[PostalCode] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[Customer](
	[CustomerID] [int] NOT NULL,
	[NameStyle] [tinyint] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[MiddleName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[CompanyName] [nvarchar](128) NULL,
	[SalesPerson] [nvarchar](256) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[PasswordHash] [varchar](128) NOT NULL,
	[PasswordSalt] [varchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]

CREATE TABLE [Stg].[CustomerAddress](
	[CustomerID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressType] [nvarchar](30) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[Product](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[Weight] [decimal](8, 2) NULL,
	[ProductCategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[ThumbNailPhoto] [varbinary](max) NULL,
	[ThumbnailPhotoFileName] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] 
GO

CREATE TABLE [Stg].[ProductCategory](
	[ProductCategoryID] [int] NOT NULL,
	[ParentProductCategoryID] [int] NULL,
	[Name] [nvarchar](30) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[ProductDescription](
	[ProductDescriptionID] [int]  NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[ProductModel](
	[ProductModelID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[ProductModelProductDescription](
	[ProductModelID] [int] NOT NULL,
	[ProductDescriptionID] [int] NOT NULL,
	[Culture] [nchar](6) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[SalesOrderDetail](
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [money] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[SalesOrderHeader](
	[SalesOrderID] [int] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[OnlineOrderFlag] [tinyint] NOT NULL,
	[SalesOrderNumber] [nvarchar](23) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](23) NULL,
	[AccountNumber] [int] NULL,
	[CustomerID] [int] NOT NULL,
	[ShipToAddressID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipMethod] [nvarchar](50) NOT NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO


CREATE TYPE [stg].[UDT_SalesOrderHeader] AS TABLE
(
	[SalesOrderID] [int] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[OnlineOrderFlag] [tinyint] NOT NULL,
	[SalesOrderNumber] [nvarchar](23) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](23) NULL,
	[AccountNumber] [int] NULL,
	[CustomerID] [int] NOT NULL,
	[ShipToAddressID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipMethod] [nvarchar](50) NOT NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	PRIMARY KEY (
		SalesOrderID
	),
	INDEX IX_OnlineOrderFlag (
		[OnlineOrderFlag]
	)
)
GO

CREATE PROCEDURE [stg].[USP_DL_SalesOrderHeader]
    @Deltatable [stg].[UDT_SalesOrderHeader] READONLY
AS                            
BEGIN
    MERGE INTO [Stg].[SalesOrderHeader] WITH (TABLOCK) AS t 
	USING 
		(SELECT 
			[SalesOrderID],
			[RevisionNumber],
			[OrderDate],
			[DueDate],
			[ShipDate],
			[Status],
			[OnlineOrderFlag],
			[SalesOrderNumber],
			[PurchaseOrderNumber],
			[AccountNumber],
			[CustomerID],
			[ShipToAddressID],
			[BillToAddressID],
			[ShipMethod],
			[CreditCardApprovalCode],
			[SubTotal],
			[TaxAmt],
			[Freight],
			[TotalDue],
			CASE		
				WHEN [Comment] IS NULL AND [OnlineOrderFlag] = 0 THEN 'Store order'
				WHEN [Comment] IS NULL AND [OnlineOrderFlag] = 1 THEN 'Online order'
				ELSE [Comment]
			END [Comment],
			[rowguid],
			[ModifiedDate]
			FROM @Deltatable
		) AS s 
	ON (  s.[SalesOrderID] = t.[SalesOrderID]  ) 
	WHEN NOT MATCHED BY TARGET 
	THEN INSERT ( 
			[SalesOrderID],
			[RevisionNumber],
			[OrderDate],
			[DueDate],
			[ShipDate],
			[Status],
			[OnlineOrderFlag],
			[SalesOrderNumber],
			[PurchaseOrderNumber],
			[AccountNumber],
			[CustomerID],
			[ShipToAddressID],
			[BillToAddressID],
			[ShipMethod],
			[CreditCardApprovalCode],
			[SubTotal],
			[TaxAmt],
			[Freight],
			[TotalDue],
			[Comment],
			[rowguid],
			[ModifiedDate]
	) 
	VALUES ( 
			[SalesOrderID],
			[RevisionNumber],
			[OrderDate],
			[DueDate],
			[ShipDate],
			[Status],
			[OnlineOrderFlag],
			[SalesOrderNumber],
			[PurchaseOrderNumber],
			[AccountNumber],
			[CustomerID],
			[ShipToAddressID],
			[BillToAddressID],
			[ShipMethod],
			[CreditCardApprovalCode],
			[SubTotal],
			[TaxAmt],
			[Freight],
			[TotalDue],
			[Comment],
			[rowguid],
			[ModifiedDate]
	);  
END;
GO
