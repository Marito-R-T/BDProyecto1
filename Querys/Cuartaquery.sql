CREATE OR REPLACE FUNCTION promedioTurnos (idh integer)
RETURNS decimal AS $$
	BEGIN
		RETURN (SELECT AVG("pe".turno)
			FROM "FichaIngreso" as "fi"
			INNER JOIN "PacienteEmergencia" as "pe"
				ON "fi".id = "pe".ficha_ingreso
			WHERE "fi".hospital = idh
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION porcentajeHabilitado (idh integer)
RETURNS decimal AS $$
	BEGIN
		RETURN (SELECT AVG("pe".camilla_disponible_entrada::int)
			FROM "FichaIngreso" as "fi"
			INNER JOIN "PacienteEmergencia" as "pe"
				ON "fi".id = "pe".ficha_ingreso
			WHERE "fi".hospital = idh
		 ) * 100;
	END;
$$ LANGUAGE plpgsql;

SELECT "h".id, "h".direccion, 
	promedioTurnos("h".id) as "turnos_promedio",
	porcentajeHabilitado("h".id) as "porcentaje_habilitado"
FROM "Hospital" as "h"
WHERE NOT(porcentajeHabilitado("h".id) IS NULL)
ORDER BY "porcentaje_habilitado"
ASC
LIMIT 3
; 
