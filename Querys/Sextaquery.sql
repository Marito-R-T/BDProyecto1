CREATE OR REPLACE FUNCTION gananciaMonetaria (idt integer)
RETURNS money AS $$
	BEGIN
		RETURN (
			SELECT SUM("c".precio)
			FROM "Cirugia" as "c"
			INNER JOIN "Intraoperatorio" as "i"
				ON "c".id = "i".cirugia
			WHERE "c".tipo = idt
			AND "i".presencia_completa = 1
			AND "i".traslado_correcto = 1
			AND "i".posicionamiento_correcto = 1
			AND "i".placa_instalada = 1
			AND "i".confirmacion_equipo = 1
 			AND "i".confirmacion_paciente = 1
			AND "i".confirmacion_buena_condicion = 1
			AND "i".configuracion_suministro = 1
			AND "i".revision = 1
			AND "i".traslado_correcto = 1
		);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION intraoperatoriasAceptables (idt integer)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "Cirugia" as "c"
			INNER JOIN "Intraoperatorio" as "i"
				ON "c".id = "i".cirugia
			WHERE "c".tipo = idt
			AND "i".presencia_completa = 1
			AND "i".traslado_correcto = 1
			AND "i".posicionamiento_correcto = 1
			AND "i".placa_instalada = 1
			AND "i".confirmacion_equipo = 1
 			AND "i".confirmacion_paciente = 1
			AND "i".confirmacion_buena_condicion = 1
			AND "i".configuracion_suministro = 1
			AND "i".revision = 1
			AND "i".traslado_correcto = 1
		);
	END;
$$ LANGUAGE plpgsql;

SELECT "ec".nombre, gananciaMonetaria("ec".id) as "ganancia_total",
	intraoperatoriasaceptables("ec".id) as "numero_cirugias"
FROM "EspecialidadCirugia" as "ec"
WHERE gananciamonetaria("ec".id) IS NOT NULL
ORDER BY "ganancia_total"
DESC
LIMIT 3
;
