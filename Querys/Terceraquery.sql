CREATE OR REPLACE FUNCTION vivos (dpi integer, i date default null, f date default null)
RETURNS integer AS $$
	BEGIN
		IF (NOT(i IS null) AND NOT(f IS NULL)) then
			RETURN (SELECT COUNT(*)
				FROM "FichaEgreso" as "fe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fe".id_ficha = "fi".id
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fe".codigo_egreso = 1
					AND "fi".medico_encargado = dpi
					AND "fe".consentido
			 );
		ELSEIF (NOT(i IS null)) THEN
			RETURN (SELECT COUNT(*)
				FROM "FichaEgreso" as "fe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fe".id_ficha = "fi".id
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fe".codigo_egreso = 1
					AND "fi".medico_encargado = dpi
					AND "fe".consentido
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
			 );
		ELSEIF (NOT(f IS null)) THEN
			RETURN (SELECT COUNT(*)
				FROM "FichaEgreso" as "fe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fe".id_ficha = "fi".id
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fe".codigo_egreso = 1
					AND "fi".medico_encargado = dpi
					AND "fe".consentido
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
			 );
		ELSE
			RETURN (SELECT COUNT(*)
				FROM "FichaEgreso" as "fe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fe".id_ficha = "fi".id
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fe".codigo_egreso = 1
					AND "fi".medico_encargado = dpi
					AND "fe".consentido
			 );
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION emergencia_realizada (dpi integer, i date default null, f date default null)
RETURNS integer AS $$
	BEGIN
		IF (NOT(i IS null) AND NOT(f IS NULL)) then
			RETURN (SELECT COUNT(*)
				FROM "FichaIngreso" as "fi"
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fi".medico_encargado = dpi
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
			 );
		ELSEIF (NOT(i IS null)) THEN
			RETURN (SELECT COUNT(*)
				FROM "FichaIngreso" as "fi"
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fi".medico_encargado = dpi
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
			 );
		ELSEIF (NOT(f IS null)) THEN
			RETURN (SELECT COUNT(*)
				FROM "FichaIngreso" as "fi"
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fi".medico_encargado = dpi
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
			 );
		ELSE
			RETURN (SELECT COUNT(*)
				FROM "FichaIngreso" as "fi"
				INNER JOIN "PacienteEmergencia" as "pe"
					ON "fi".id = "pe".ficha_ingreso
				WHERE "fi".medico_encargado = dpi
			 );
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eficienciaMedicosEmergencia (i date default null, f date default null)
RETURNS TABLE(medico integer, vivos integer, turnos integer, hospital_id integer, direccion varchar(30)) AS $$
	BEGIN
		RETURN query SELECT "p".persona, vivos("p".persona, i, f) as "vivos",
			emergencia_realizada("p".persona, i, f) as "turnos",
			"h".id as "hospital_id", "h".direccion
		FROM "Personal" as "p"
		INNER JOIN "Hospital" as "h"
			ON "p".hospital = "h".id
		WHERE emergencia_realizada("p".persona, i, f) > 0
		ORDER BY "vivos", "turnos"
		DESC
		LIMIT 5;
	END;
$$ LANGUAGE plpgsql;

SELECT "e".medico, "e".vivos, "e".turnos, "e".hospital_id, "e".direccion FROM eficienciaMedicosEmergencia('2020/12/12', '2020/12/12') as "e";
