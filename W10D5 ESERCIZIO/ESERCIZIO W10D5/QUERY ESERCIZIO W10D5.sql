-- 1.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).
SELECT A.EnglishProductName, A.EnglishDescription, B.EnglishProductSubcategoryName
FROM dimproduct A JOIN dimproductsubcategory B ON A.ProductSubcategoryKey = B.ProductSubcategoryKey;

-- 2.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory).
SELECT A.EnglishProductName, A.EnglishDescription, B.EnglishProductSubcategoryName, C.EnglishProductCategoryName
FROM dimproduct A JOIN dimproductsubcategory B ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
                  JOIN dimproductcategory C ON B.ProductCategoryKey = C.ProductCategoryKey;

-- 3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales).
SELECT DISTINCT B.EnglishProductName, B.ProductKey
FROM factresellersales A LEFT JOIN dimproduct B ON A.ProductKey = B.ProductKey
WHERE SalesAmount > 0;

-- 4.Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
SELECT D.* 
FROM dimproduct D 
WHERE D.ProductKey NOT IN (SELECT DISTINCT  B.ProductKey
FROM factresellersales A LEFT JOIN dimproduct B ON A.ProductKey = B.ProductKey
WHERE SalesAmount > 0)
AND D.FinishedGoodsFlag = 1;

-- Verifica punto 4
SELECT *
FROM factresellersales A LEFT JOIN dimproduct B ON A.ProductKey = B.ProductKey
WHERE B.ProductKey IN (210,211,226,227,228,244);

-- 5.Esponi l’elenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
SELECT A.*, B.EnglishProductName
FROM FactResellerSales A LEFT JOIN DimProduct B ON  B.ProductKey = A.ProductKey
WHERE SalesAmount > 0; 

-- 6.Esponi l’elenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
SELECT A.*, B.EnglishProductName, D.EnglishProductCategoryName
FROM FactResellerSales A LEFT JOIN DimProduct B ON  B.ProductKey = A.ProductKey
                         LEFT JOIN dimproductsubcategory C ON B.ProductSubcategoryKey=C.ProductSubcategoryKey
                         LEFT JOIN dimproductcategory D ON C.ProductCategoryKey=D.ProductCategoryKey
WHERE SalesAmount > 0; 

-- 7.Esplora la tabella DimReseller.
SELECT *
FROM dimreseller;

-- 8.Esponi in output l’elenco dei reseller indicando, per ciascun reseller, anche la sua area geografica.
SELECT A.ResellerKey, A. ResellerName, B.*
FROM dimreseller A LEFT JOIN dimgeography B ON A.GeographyKey = B.GeographyKey;

-- 9-Esponi l’elenco delle transazioni di vendita. Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e l’area geografica.
SELECT A.SalesOrderNumber, A.SalesOrderLineNumber, A.OrderDate, A.UnitPrice, A.OrderQuantity, A.TotalProductCost, B.EnglishProductName,C.EnglishProductCategoryName, D.ResellerName, E.EnglishCountryRegionName
FROM factresellersales A LEFT JOIN dimproduct B ON A.ProductKey=B.ProductKey
		         		 LEFT JOIN dimproductsubcategory F ON B.ProductSubcategoryKey=F.ProductSubcategoryKey
						 LEFT JOIN dimproductcategory C ON F.ProductCategoryKey=C.ProductCategoryKey
                         LEFT JOIN dimreseller D ON A.ResellerKey=D.ResellerKey
						 LEFT JOIN dimgeography E ON D.GeographyKey=E.GeographyKey;

