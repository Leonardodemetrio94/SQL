-- 1.Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia?
SELECT COUNT(*) AS CONTEGGIO_RIGHE_TOTALI, COUNT(DISTINCT A.ProductKey) AS CONTEGGIO_RIGHE_CHIAVE
FROM DimProduct A;

-- 2.Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
SELECT COUNT(*) AS CONTEGGIO_RIGHE_TOTALI, COUNT(DISTINCT(CONCAT(A.SalesOrderNumber,A.SalesOrderLineNumber))) 
FROM factresellersales A;

-- 3.Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT  OrderDate AS DATA_ORDINE , COUNT(DISTINCT SalesOrderNumber) AS NUMERO_TRANSAZIONI
FROM factresellersales 
WHERE OrderDate >= "2020-01-01"
GROUP BY OrderDate
ORDER BY OrderDate;

-- 4.Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!
SELECT B.EnglishProductName, SUM(A.SalesAmount) AS FATTURATO_TOTALE, SUM(A.OrderQuantity) AS QUANTITA_TOTALE , SUM(A.SalesAmount)/SUM(A.OrderQuantity) AS PREZZO_MEDIO
FROM factresellersales A LEFT JOIN DimProduct  B on A.ProductKey=B.ProductKey
WHERE A.OrderDate >= "2020-01-01"
GROUP BY B.EnglishProductName
ORDER BY 1;

-- 5.Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) per Categoria prodotto (DimProductCategory). Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!
SELECT SUM(A.SalesAmount) AS FATTURATOTOTALE, SUM(A.OrderQuantity) AS QUANTITATOTALE, D.EnglishProductCategoryName as nomeprodotto
FROM factresellersales A left JOIN DimProduct B on a.productkey=b.productkey
LEFT join dimproductsubcategory C on B.productsubcategoRykey=C.productsubcategoRykey
LEFT JOIN Dimproductcategory D ON  C.productcategorykey=D.productcategorykey
GROUP BY D.EnglishProductCategoryName;


-- 6.Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
SELECT A.City,SUM(C.SalesAmount) AS FATTURATOTOTALE
FROM dimgeography A LEFT JOIN dimreseller B ON A.GeographyKey=B.GeographyKey
LEFT JOIN factresellersales C ON B.ResellerKey=C.ResellerKey
WHERE C.OrderDate >= "2020-01-01" 
GROUP BY A.City
HAVING SUM(C.SalesAmount)> 60000
ORDER BY 1;