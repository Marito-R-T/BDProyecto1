CREATE OR REPLACE FUNCTION objetosUsados (dpi integer, i date default null, f date default null)
RETURNS integer AS $$
	BEGIN
		IF (i IS null AND f IS null) THEN
			RETURN (
				SELECT COUNT(*)
				FROM "UsoEquipo" as "ue"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ue".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
			 ) + 
			 (
				SELECT COUNT(*)
				FROM "UsoInstrumento" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
			 ) +
			 (
				SELECT COUNT(*)
				FROM "UsoInsumo" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
			 );
		ELSEIF (i IS null) THEN
			RETURN (
				SELECT COUNT(*)
				FROM "UsoEquipo" as "ue"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ue".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND f >= ue.fecha_uso
			 ) + 
			 (
				SELECT COUNT(*)
				FROM "UsoInstrumento" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND f >= ui.fecha_uso
			 ) +
			 (
				SELECT COUNT(*)
				FROM "UsoInsumo" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND f >= ui.fecha_uso
			 );
		ELSEIF (f IS null) THEN
			RETURN (
				SELECT COUNT(*)
				FROM "UsoEquipo" as "ue"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ue".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i <= ue.fecha_uso
			 ) + 
			 (
				SELECT COUNT(*)
				FROM "UsoInstrumento" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i <= ui.fecha_uso
			 ) +
			 (
				SELECT COUNT(*)
				FROM "UsoInsumo" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i <= ui.fecha_uso
			 );
		ELSE
			RETURN (
				SELECT COUNT(*)
				FROM "UsoEquipo" as "ue"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ue".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i >= ue.fecha_uso
					AND i <= ue.fecha_uso
			 ) + 
			 (
				SELECT COUNT(*)
				FROM "UsoInstrumento" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i >= ui.fecha_uso
					AND i <= ui.fecha_uso
			 ) +
			 (
				SELECT COUNT(*)
				FROM "UsoInsumo" as "ui"
				INNER JOIN "AsignacionMedicoCirugia" as "am"
					ON "ui".agendamiento = "am".cirugia
				WHERE "am".medico = dpi
					AND i >= ui.fecha_uso
					AND i <= ui.fecha_uso
			 );
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION porcentajeAceptados (dpi integer, i date default null, f date default null)
RETURNS decimal AS $$
	BEGIN
		IF (i IS null AND f IS null) THEN
			RETURN (
				SELECT AVG("aq".aceptada::int)
				FROM "AgendamientoQuirurgico" as "aq"
				INNER JOIN "AsignacionMedico" as "am"
					ON "aq".preoperatoria = "am".cirugia
				WHERE "am".medico = dpi
			 ) * 100;
		ELSEIF (i IS null) THEN
			RETURN (
				SELECT AVG("aq".aceptada::int)
				FROM "AgendamientoQuirurgico" as "aq"
				INNER JOIN "AsignacionMedico" as "am"
					ON "aq".preoperatoria = "am".cirugia
				WHERE "am".medico = dpi
					AND (EXTRACT(YEAR FROM f) > aq.año
						OR (EXTRACT(YEAR FROM f) = aq.año AND EXTRACT(MONTH FROM f) > aq.mes)
						OR (EXTRACT(YEAR FROM f) = aq.año AND EXTRACT(MONTH FROM f) = aq.mes AND EXTRACT(DAY FROM f) >= aq.dia)
					)
			 ) * 100;
		ELSEIF (f IS null) THEN
			RETURN (
				SELECT AVG("aq".aceptada::int)
				FROM "AgendamientoQuirurgico" as "aq"
				INNER JOIN "AsignacionMedico" as "am"
					ON "aq".preoperatoria = "am".cirugia
				WHERE "am".medico = dpi
					AND (EXTRACT(YEAR FROM i) < aq.año
						OR (EXTRACT(YEAR FROM i) = aq.año AND EXTRACT(MONTH FROM i) < aq.mes)
						OR (EXTRACT(YEAR FROM i) = aq.año AND EXTRACT(MONTH FROM i) = aq.mes AND EXTRACT(DAY FROM i) <= aq.dia)
					)
			 ) * 100;
		ELSE
			RETURN (
				SELECT AVG("aq".aceptada::int)
				FROM "AgendamientoQuirurgico" as "aq"
				INNER JOIN "AsignacionMedico" as "am"
					ON "aq".preoperatoria = "am".cirugia
				WHERE "am".medico = dpi
					AND (EXTRACT(YEAR FROM f) > aq.año
						OR (EXTRACT(YEAR FROM f) = aq.año AND EXTRACT(MONTH FROM f) > aq.mes)
						OR (EXTRACT(YEAR FROM f) = aq.año AND EXTRACT(MONTH FROM f) = aq.mes AND EXTRACT(DAY FROM f) >= aq.dia)
					)
					AND (EXTRACT(YEAR FROM i) < aq.año
						OR (EXTRACT(YEAR FROM i) = aq.año AND EXTRACT(MONTH FROM i) < aq.mes)
						OR (EXTRACT(YEAR FROM i) = aq.año AND EXTRACT(MONTH FROM i) = aq.mes AND EXTRACT(DAY FROM i) <= aq.dia)
					)
			 ) * 100;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eficienciaMedicosCirujanos (i date default null, f date default null)
RETURNS TABLE(medico integer, objetos_usado integer, porcentaje_aceptado decimal) AS $$
	BEGIN
		RETURN query SELECT "mc".medico, objetosUsados("mc".medico, i, f) as "objetos_usados",
			porcentajeaceptados("mc".medico, i, f) as "porcentaje_aceptados"
		FROM "MedicoCirugia" as "mc"
		WHERE NOT(porcentajeaceptados("mc".medico, i, f) IS NULL)
		ORDER BY objetos_usados ASC, porcentaje_aceptados DESC
		;
	END;
$$ LANGUAGE plpgsql;

SELECT "em".medico, "em".objetos_usado,
	"em".porcentaje_aceptado
FROM eficienciamedicoscirujanos(null, null) as "em"
; 
