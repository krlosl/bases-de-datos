USE sanitat;
SELECT HOSPITAL_COD as "Código", SALA_COD as "Código sala", EMPLEAT_NO as "Num Empleado", COGNOM
FROM PLANTILLA
	WHERE TORN != "N";

-- WHERE TORN IN ("T, M");
-- WHERE TORN <> "N";
-- WHERE TORN = "M" OR TORN = "T";
-- WHERE NOT TORN = "N";