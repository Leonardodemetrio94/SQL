/*QUERY 3*,Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey) comincia con FR oppure BK. Il result set deve contenere il codice prodotto (ProductKey), il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).
Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dall’azienda (ListPrice - StandardCost)*/
SELECT 
    PRODUCTALTERNATEKEY,
    PRODUCTKEY,
    MODELNAME AS MODELLO,
    ENGLISHPRODUCTNAME AS NOME_DEL_PRODOTTO,
    STANDARDCOST AS COSTO_STANDARD,
    LISTPRICE AS LISTINO,
    LISTPRICE - STANDARDCOST AS MARKUP
    
FROM
    ADB.DIMPRODUCT
WHERE
    PRODUCTALTERNATEKEY LIKE 'FR%'
        OR PRODUCTALTERNATEKEY LIKE 'BK%'
