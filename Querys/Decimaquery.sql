SELECT 
	"h".id,
	"h".direccion,
	CONCAT("fe".año, '/', "fe".mes, '/', "fe".dia) as fecha,
	COUNT(*) as "descesos"
FROM  "FichaEgreso" as "fe"
INNER JOIN "FichaIngreso" as "fi"
	ON "fe".id_ficha = "fi".id
INNER JOIN "Hospital" as "h"
	ON "h".id = "fi".hospital
WHERE "fe".codigo_egreso = 2
GROUP BY "fe".año, "fe".mes, "fe".dia, "h".id
ORDER BY "descesos"
DESC
LIMIT 3
; 
