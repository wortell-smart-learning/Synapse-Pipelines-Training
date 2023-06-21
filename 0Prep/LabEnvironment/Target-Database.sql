CREATE SCHEMA [Stg]
GO

CREATE TABLE [Stg].[Dates] (
    [DateKey]   	INT          NOT NULL,
    [Date]          DATE         NULL,
    [DayOfMonth]    TINYINT      NULL,
    [Month]         VARCHAR (8)  NULL,
    [MonthLong]     VARCHAR (14) NULL,
    [MonthName]     CHAR (3)     NULL,
    [MonthNameLong] VARCHAR (9)  NULL,
    [MonthNr]       TINYINT      NULL,
    [YearMonth]     INT          NULL,
    [MonthStart]    DATE         NULL,
    [MonthEnd]      DATE         NULL,
    [Quarter]       CHAR (7)     NULL,
    [QuarterName]   CHAR (3)     NULL,
    [QuarterNr]     TINYINT      NULL,
    [Year]          SMALLINT     NULL,
    [IsoWeek]       TINYINT      NULL,
    [IsoYear]       SMALLINT     NULL,
    [YearWeek]      INT          NULL,
    [DayOfWeek]     TINYINT      NULL,
    [DayNameLong]   VARCHAR (9)  NULL,
    [DayNameShort]  CHAR (3)     NULL,
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[ProductCategoryDiscount](
[Name] [nvarchar](30) NOT NULL,
[Discount] DECIMAL(4,2) NULL
) ON [PRIMARY]
GO

CREATE TABLE [Stg].[SalesPersonal](
	[SalesPerson] [nvarchar](256) NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[MiddleName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailAddress] [nvarchar](50) NULL
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
	[NameStyle] [bit] NOT NULL,
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
GO

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
	[Name] [nvarchar](50) NOT NULL,
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
	[OnlineOrderFlag] [bit] NOT NULL,
	[SalesOrderNumber] [nvarchar](23) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](23) NULL,
	[AccountNumber] [nvarchar](23) NULL,
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
	[OnlineOrderFlag] [bit] NOT NULL,
	[SalesOrderNumber] [nvarchar](23) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](23) NULL,
	[AccountNumber] [nvarchar](23) NULL,
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

CREATE PROCEDURE [stg].[USP_DL_Dates]
    @StartYear  smallint,
	@EndYear smallint
AS                            
BEGIN
WITH e1(n) AS
(
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
), -- 10
e2(n) AS (SELECT 1 FROM e1 CROSS JOIN e1 AS b), -- 10*10
e3(n) AS (SELECT 1 FROM e2 CROSS JOIN e2 AS b), -- 100*100
e4(n) AS (SELECT 1 FROM e3 CROSS JOIN (SELECT TOP 5 n FROM e1) AS b)  -- 5*10000
,e5 as (SELECT Dateadd(Day, Row_number()OVER (ORDER BY n) - 1, Cast(CONVERT(varchar(4),@StartYear) + '-01-01' AS DATE)) AS dates
        FROM   e4),
DateTable AS (

       SELECT DateKey = CONVERT(int,LEFT(CONVERT(CHAR(8), dates, 112), 8)),
			  [Date] = dates,
			  [DayOfMonth] = DAY(dates),
              [Month] = CONCAT(Year(dates), ' ', LEFT(DATENAME(Month,(dates)),3)),
			  [MonthLong] = CONCAT(Year(dates),' ', DATENAME(Month,(dates))),
			  [MonthName] = LEFT(DATENAME(Month,(dates)),3),
			  [MonthNameLong] = DATENAME(Month,(dates)),
			  [MonthNr] = Month(dates),
			  [YearMonth] = CONCAT(YEAR(dates), RIGHT(CONCAT('0',MONTH(dates)),2)),
			  [MonthStart] = CONVERT(date,DATEADD(mm, DATEDIFF(mm, 0, dates), 0)),
			  [MonthEnd] = CONVERT(date,DATEADD(dd, -1, DATEADD(mm, DATEDIFF(mm, 0, dates) + 1, 0))),
			  [Quarter] = CONCAT(Year(dates), ' Q', DATEPART(q,dates)),
			  [QuarterName] = CONCAT('Q', DATEPART(q,dates)),
			  [QuarterNr] = Month(dates) / 4 + 1,
              [Year] = Year(dates),
			  [IsoWeek] = DATEPART(ISO_WEEK,dates),
			  [IsoYear] =  CASE
							WHEN Datepart(isowk, dates) = 1 AND Month(dates) = 12 THEN Year(dates)+1
							WHEN Datepart(isowk, dates) = 53 AND Month(dates) = 1 THEN Year(dates)-1
							WHEN Datepart(isowk, dates) = 52 AND Month(dates) = 1 THEN Year(dates)-1             
							ELSE Year(dates)
							END,
             [YearWeek] = CONVERT(NVARCHAR(4), 
                          CASE
							WHEN Datepart(isowk, dates) = 1 AND Month(dates) = 12 THEN Year(dates)+1
							WHEN Datepart(isowk, dates) = 53 AND Month(dates) = 1 THEN Year(dates)-1
							WHEN Datepart(isowk, dates) = 52 AND Month(dates) = 1 THEN Year(dates)-1             
							ELSE Year(dates)
							END)
                            + RIGHT('0' + CONVERT(nvarchar(2),DATEPART(ISO_WEEK,dates)),2),
			 [DayOfWeek] = DATEPART(weekday,dates),
			 [DayNameLong] = DATENAME(dw,dates),
			 [DayNameShort] = LEFT(DATENAME(dw,dates),3)

       FROM   e5
       WHERE  Year(dates) <= @EndYear 
)
MERGE INTO [Stg].[Dates] AS t 
	USING 
		(SELECT 
			 * FROM DateTable
		) AS s 
	ON (  s.[DateKey] = t.[DateKey]  ) 
	WHEN NOT MATCHED BY TARGET 
	THEN INSERT ( 
			[DateKey],
            [Date],
            [DayOfMonth],
            [Month],
            [MonthLong],
            [MonthName],
            [MonthNameLong],
            [MonthNr],
            [YearMonth],
            [MonthStart],
            [MonthEnd],
            [Quarter],
            [QuarterName],
            [QuarterNr],
            [Year],
            [IsoWeek],
            [IsoYear],
            [YearWeek],
            [DayOfWeek],
            [DayNameLong],
            [DayNameShort] 
	) 
	VALUES ( 
			[DateKey],
            [Date],
            [DayOfMonth],
            [Month],
            [MonthLong],
            [MonthName],
            [MonthNameLong],
            [MonthNr],
            [YearMonth],
            [MonthStart],
            [MonthEnd],
            [Quarter],
            [QuarterName],
            [QuarterNr],
            [Year],
            [IsoWeek],
            [IsoYear],
            [YearWeek],
            [DayOfWeek],
            [DayNameLong],
            [DayNameShort] 
	);  
END;
GO
