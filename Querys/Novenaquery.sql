CREATE OR REPLACE FUNCTION gananciaHospital(idh integer)
RETURNS money AS $$
	DECLARE
		hosp money = 0;
		cons money = 0;
		cirug money = 0;
		emerg money = 0;
		suma money = 0;
	BEGIN
		hosp = SUM("hp".costo)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh;
		cirug = SUM("c".precio)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh;
		cons = SUM("c".total)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh;
		emerg = SUM("pe".total)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh;
		IF hosp IS NOT NULL THEN
			suma = suma + hosp;
		END IF;
		IF cirug IS NOT NULL THEN
			suma = suma + cirug;
		END IF;
		IF cons IS NOT NULL THEN
			suma = suma + cons;
		END IF;
		IF emerg IS NOT NULL THEN
			suma = suma + emerg;
		END IF;
		RETURN suma;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gananciaHospitalF(idh integer, f date)
RETURNS money AS $$
	DECLARE
		hosp money = 0;
		cons money = 0;
		cirug money = 0;
		emerg money = 0;
		suma money = 0;
	BEGIN
		hosp = SUM("hp".costo)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		cirug = SUM("c".precio)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		cons = SUM("c".total)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM f) > "c".año
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) > "c".mes)
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) = "c".mes AND EXTRACT(DAY FROM f) >= "c".dia)
					);
		emerg = SUM("pe".total)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		IF hosp IS NOT NULL THEN
			suma = suma + hosp;
		END IF;
		IF cirug IS NOT NULL THEN
			suma = suma + cirug;
		END IF;
		IF cons IS NOT NULL THEN
			suma = suma + cons;
		END IF;
		IF emerg IS NOT NULL THEN
			suma = suma + emerg;
		END IF;
		RETURN suma;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gananciaHospitalI(idh integer, i date)
RETURNS money AS $$
	DECLARE
		hosp money = 0;
		cons money = 0;
		cirug money = 0;
		emerg money = 0;
		suma money = 0;
	BEGIN
		hosp = SUM("hp".costo)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					);
		cirug = SUM("c".precio)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					);
		cons = SUM("c".total)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM i) < "c".año
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) < "c".mes)
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) = "c".mes AND EXTRACT(DAY FROM i) <= "c".dia)
					);
		emerg = SUM("pe".total)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					);
		IF hosp IS NOT NULL THEN
			suma = suma + hosp;
		END IF;
		IF cirug IS NOT NULL THEN
			suma = suma + cirug;
		END IF;
		IF cons IS NOT NULL THEN
			suma = suma + cons;
		END IF;
		IF emerg IS NOT NULL THEN
			suma = suma + emerg;
		END IF;
		RETURN suma;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gananciaHospitalIF(idh integer, i date, f date)
RETURNS money AS $$
	DECLARE
		hosp money = 0;
		cons money = 0;
		cirug money = 0;
		emerg money = 0;
		suma money = 0;
	BEGIN
		hosp = SUM("hp".costo)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		cirug = SUM("c".precio)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		cons = SUM("c".total)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM i) < "c".año
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) < "c".mes)
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) = "c".mes AND EXTRACT(DAY FROM i) <= "c".dia)
					)
					AND (EXTRACT(YEAR FROM f) > "c".año
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) > "c".mes)
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) = "c".mes AND EXTRACT(DAY FROM f) >= "c".dia)
					);
		emerg = SUM("pe".total)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					);
		IF hosp IS NOT NULL THEN
			suma = suma + hosp;
		END IF;
		IF cirug IS NOT NULL THEN
			suma = suma + cirug;
		END IF;
		IF cons IS NOT NULL THEN
			suma = suma + cons;
		END IF;
		IF emerg IS NOT NULL THEN
			suma = suma + emerg;
		END IF;
		RETURN suma;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ingresosPacientesHospital(idh integer)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
		) +
		(
			SELECT COUNT(*)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
		) +
		(
			SELECT COUNT(*)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
		) +
		(
			SELECT COUNT(*)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
		);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ingresosPacientesHospitalF(idh integer, f date)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM f) > "c".año
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) > "c".mes)
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) = "c".mes AND EXTRACT(DAY FROM f) >= "c".dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ingresosPacientesHospitalI(idh integer, i date)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM i) < "c".año
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) < "c".mes)
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) = "c".mes AND EXTRACT(DAY FROM i) <= "c".dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
		);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ingresosPacientesHospitalIF(idh integer, i date, f date)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
					AND (EXTRACT(YEAR FROM i) < "c".año
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) < "c".mes)
						OR (EXTRACT(YEAR FROM i) = "c".año AND EXTRACT(MONTH FROM i) = "c".mes AND EXTRACT(DAY FROM i) <= "c".dia)
					)
					AND (EXTRACT(YEAR FROM f) > "c".año
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) > "c".mes)
						OR (EXTRACT(YEAR FROM f) = "c".año AND EXTRACT(MONTH FROM f) = "c".mes AND EXTRACT(DAY FROM f) >= "c".dia)
					)
		) +
		(
			SELECT COUNT(*)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
					AND (EXTRACT(YEAR FROM i) < fi.año
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) < fi.mes)
						OR (EXTRACT(YEAR FROM i) = fi.año AND EXTRACT(MONTH FROM i) = fi.mes AND EXTRACT(DAY FROM i) <= fi.dia)
					)
					AND (EXTRACT(YEAR FROM f) > fi.año
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) > fi.mes)
						OR (EXTRACT(YEAR FROM f) = fi.año AND EXTRACT(MONTH FROM f) = fi.mes AND EXTRACT(DAY FROM f) >= fi.dia)
					)
		);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gananciaTotalHospitalTiempo (i date default null, f date default null)
RETURNS TABLE(id_hospital integer, direccion varchar(30), ganancia_hospital money, ingresos_pacientes integer) AS $$
	BEGIN
		IF i IS NOT NULL AND f IS NOT NULL THEN
			RETURN query 
				SELECT "h".id, "h".direccion,
					gananciaHospitalIF("h".id, i, f) as "ganancia_hospital", 
					ingresosPacientesHospitalIF("h".id, i, f) as "ingresos_pacientes"
				FROM "Hospital" as "h"
				WHERE gananciaHospital("h".id)::decimal > 0.00
			;
		ELSEIF i IS NOT NULL THEN
			RETURN query 
				SELECT "h".id, "h".direccion,
					gananciaHospitalI("h".id, i) as "ganancia_hospital", 
					ingresosPacientesHospitalI("h".id, i) as "ingresos_pacientes"
				FROM "Hospital" as "h"
				WHERE gananciaHospitalI("h".id, i)::decimal > 0.00
			;
		ELSEIF f IS NOT NULL THEN
			RETURN query 
				SELECT "h".id, "h".direccion,
					gananciaHospitalF("h".id, f) as "ganancia_hospital", 
					ingresosPacientesHospitalF("h".id, f) as "ingresos_pacientes"
				FROM "Hospital" as "h"
				WHERE gananciaHospitalF("h".id, f)::decimal > 0.00
			;
		ELSE
			RETURN query 
				SELECT "h".id, "h".direccion,
					gananciaHospital("h".id) as "ganancia_hospital", 
					ingresosPacientesHospital("h".id) as "ingresos_pacientes"
				FROM "Hospital" as "h"
				WHERE gananciaHospital("h".id)::decimal > 0.00
			;
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT "h".id_hospital, "h".direccion,
	"h".ganancia_hospital, 
	"h".ingresos_pacientes
FROM gananciaTotalHospitalTiempo(null, null) as "h"
ORDER BY "h".ganancia_hospital desc
LIMIT 3
; 
