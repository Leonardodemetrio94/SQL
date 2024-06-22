/*Esponi, interrogando la tabella degli impiegati aziendali, l’elenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.*/
SELECT SALESPERSONFLAG,FIRSTNAME, LASTNAME,MIDDLENAME,BIRTHDATE,GENDER,POSITION
FROM ADB.DIMEMPLOYEE
WHERE SALESPERSONFLAG=1