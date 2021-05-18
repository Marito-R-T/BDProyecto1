CREATE OR REPLACE FUNCTION promedioCalificacionPersonal (dpi integer)
RETURNS decimal AS $$
	BEGIN
		RETURN (SELECT AVG("c".calificacion)
			FROM "CalificacionPersonal" as "c"
			WHERE "c".personal = dpi
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cantidadConsulta (dpi integer)
RETURNS integer AS $$
	BEGIN
		RETURN (SELECT COUNT(*)
			FROM "Consulta" as "c"
			INNER JOIN "FichaCita" as "f"
				ON "f".id = "c".cita
			WHERE "f".medico = dpi
		 );
	END;
$$ LANGUAGE plpgsql;

SELECT "pr".dpi, "pr".nombres, "pr".apellidos,
	promedioCalificacionPersonal("pr".dpi) as "promedio",
	cantidadConsulta("pr".dpi) as "consultas"
FROM "PersonaRegistrada" AS "pr"
INNER JOIN "MedicoConsulta" AS "mc"
ON "pr".dpi = "mc".medico
ORDER BY (promedioCalificacionPersonal("pr".dpi))
ASC
LIMIT 5
; 
