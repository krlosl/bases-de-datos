USE sanitat;
SELECT HOSPITAL_COD as "Código", NOM as "Nombre", TELEFON as "Teléfono"
FROM HOSPITAL
WHERE SUBSTRING(NOM, 2, 1) = 'A';

-- WHERE SUBSTR(NOM, 1, 2) = "La";
-- WHERE HOSPITAL.NOM LIKE "__%n";
