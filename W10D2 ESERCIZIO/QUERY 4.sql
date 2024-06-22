/*Scrivi un’altra query al fine di esporre l’elenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.*/
SELECT 
    PRODUCTALTERNATEKEY,
    PRODUCTKEY,
    MODELNAME AS MODELLO,
    ENGLISHPRODUCTNAME AS NOME_DEL_PRODOTTO,
    STANDARDCOST AS COSTO_STANDARD,
    FINISHEDGOODSFLAG AS FINITO,
    LISTPRICE AS PRICE,
    LISTPRICE - STANDARDCOST AS MARKUP
FROM
    ADB.DIMPRODUCT
WHERE STANDARDCOST BETWEEN 1000 AND 2000 AND  FINISHEDGOODSFLAG=1