/*QUERY 2,  Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag. Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.
Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.*/
SELECT 
    CHIAVE_PRODOTTO,
    PRODUCTALTERNATEKEY,
    NAME,
    COLORE,
    COST0,
	FINITO
FROM
(SELECT 
    PRODUCTKEY AS CHIAVE_PRODOTTO,
    PRODUCTALTERNATEKEY,
    ENGLISHPRODUCTNAME AS NAME,
    COLOR AS COLORE,
    STANDARDCOST AS COST0,
    FINISHEDGOODSFLAG AS FINITO
FROM
    ADB.DIMPRODUCT) AS PROTTO
WHERE
  FINITO = 1