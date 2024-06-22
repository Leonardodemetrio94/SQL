/*1.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).*/
SELECT A.*,B.ENGLISHPRODUCTSUBCATEGORYNAME
FROM DIMPRODUCT A 
      JOIN DimProductSubcategory B ON A.ProductSubcategoryKey = B.ProductSubcategoryKey;

/*2.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory).*/
SELECT A.*, B.ENGLISHPRODUCTSUBCATEGORYNAME, C.EnglishProductCategoryName
FROM DIMPRODUCT A 
      JOIN DimProductSubcategory B ON A.ProductSubcategoryKey = B.ProductSubcategoryKey 
	  JOIN DimProductCategory C ON B.ProductcategoryKey = C.ProductcategoryKey;


/*3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales)*/
	SELECT A.*,B.*
    FROM DimProduct A JOIN FactResellerSales B ON A.ProductKey=B.ProductKey
    WHERE SalesAmount > 0;
    
    
/*3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales) CON IL NOME SCRITTO UNA SOLA VOLTA.*/
    SELECT DISTINCT A.Englishproductname, A.ProductKey
    FROM DimProduct A JOIN FactResellerSales B ON A.ProductKey=B.ProductKey
    WHERE SalesAmount > 0;
    
/*4.Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).*/
    SELECT *
    FROM DimProduct
    WHERE ProductKey NOT IN 
    (SELECT DISTINCT A.ProductKey
    FROM DimProduct A JOIN FactResellerSales B ON A.ProductKey=B.ProductKey) 
    AND FinishedGoodsFlag=1 
    
