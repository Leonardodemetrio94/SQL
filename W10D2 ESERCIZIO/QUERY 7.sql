/*Interroga la tabella delle vendite (FactResellerSales). Esponi in output l’elenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).*/
SELECT *,SALESAMOUNT-TOTALPRODUCTCOST
FROM ADB.FACTRESELLERSALES 
WHERE ORDERDATE>= '2020-01-01' AND PRODUCTKEY IN (597,598,477,214)
/* ANCHE 
AND (PRODUCTKEY=597
OR PRODUCTKEY=598
OR PRODUCTKEY=477
OR PRODUCTKEY=214)*/