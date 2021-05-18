CREATE OR REPLACE FUNCTION gananciaMonetariaHospitalizacion (idh integer)
RETURNS money AS $$
	BEGIN
		RETURN (SELECT SUM("hp".costo)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
		);
	END;
$$ LANGUAGE plpgsql;

SELECT "h".id, "h".direccion, "h".camillas_hospitalizacion, gananciaMonetariaHospitalizacion("h".id) as "ganancia_total"
FROM "Hospital" as "h"
WHERE gananciaMonetariaHospitalizacion("h".id) IS NOT NULL
ORDER BY "ganancia_total", "camillas_hospitalizacion"
DESC
LIMIT 3
; 
