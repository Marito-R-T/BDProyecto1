/*    PRIMER INCISO INCISO   */
CREATE OR REPLACE FUNCTION consultasporhospital (h integer)
RETURNS integer AS $$
	BEGIN
		RETURN (SELECT COUNT(*)
			FROM "FichaCita" as "f"
			INNER JOIN "Consulta" as "co"
				ON f.id = co.cita
			INNER JOIN "Clinica" as "c"
				ON c.numero_clinica = co.clinica
		  	WHERE c.hospital = h AND NOT(f.cancelada)
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION consultasporhospitalI (h integer, i date)
RETURNS integer AS $$
	BEGIN
		RETURN (SELECT COUNT(*)
			FROM "FichaCita" as "f"
			INNER JOIN "Consulta" as "co"
				ON f.id = co.cita
			INNER JOIN "Clinica" as "c"
				ON c.numero_clinica = co.clinica
		  	WHERE c.hospital = h 
				AND NOT(f.cancelada)
				AND (EXTRACT(YEAR FROM i) < f.año
					OR (EXTRACT(YEAR FROM i) = f.año AND EXTRACT(MONTH FROM i) < f.mes)
					OR (EXTRACT(YEAR FROM i) = f.año AND EXTRACT(MONTH FROM i) = f.mes AND EXTRACT(DAY FROM i) <= f.dia)
				)
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION consultasporhospitalF (h integer, fi date)
RETURNS integer AS $$
	BEGIN
		RETURN (SELECT COUNT(*)
			FROM "FichaCita" as "f"
			INNER JOIN "Consulta" as "co"
				ON f.id = co.cita
			INNER JOIN "Clinica" as "c"
				ON c.numero_clinica = co.clinica
		  	WHERE c.hospital = h 
				AND NOT(f.cancelada)
				AND (EXTRACT(YEAR FROM fi) > f.año
					OR (EXTRACT(YEAR FROM fi) = f.año AND EXTRACT(MONTH FROM fi) > f.mes)
					OR (EXTRACT(YEAR FROM fi) = f.año AND EXTRACT(MONTH FROM fi) = f.mes AND EXTRACT(DAY FROM fi) >= f.dia)
				)
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION consultasporhospitalIF (h integer, i date, fi date)
RETURNS integer AS $$
	BEGIN
		RETURN (SELECT COUNT(*)
			FROM "FichaCita" as "f"
			INNER JOIN "Consulta" as "co"
				ON f.id = co.cita
			INNER JOIN "Clinica" as "c"
				ON c.numero_clinica = co.clinica
		  	WHERE c.hospital = h 
				AND NOT(f.cancelada)
				AND (EXTRACT(YEAR FROM fi) > f.año
					OR (EXTRACT(YEAR FROM fi) = f.año AND EXTRACT(MONTH FROM fi) > f.mes)
					OR (EXTRACT(YEAR FROM fi) = f.año AND EXTRACT(MONTH FROM fi) = f.mes AND EXTRACT(DAY FROM fi) >= f.dia)
				)
				AND (EXTRACT(YEAR FROM i) < f.año
					OR (EXTRACT(YEAR FROM i) = f.año AND EXTRACT(MONTH FROM i) < f.mes)
					OR (EXTRACT(YEAR FROM i) = f.año AND EXTRACT(MONTH FROM i) = f.mes AND EXTRACT(DAY FROM i) <= f.dia)
				)
		 );
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION demandaConsultaHospital (i date default null, fi date default null)
RETURNS TABLE(idHospital integer, direccion varchar(30), numeroConsultas integer) AS $$
	BEGIN
		if (NOT(i IS NULL) AND NOT(fi IS NULL)) then
			RETURN query 
				SELECT "h".id, "h".direccion, consultasporhospitalIF(h.id, i, fi) FROM "Hospital" as "h" 
				ORDER BY consultasporhospitalIF(h.id, i, fi)
				DESC
				LIMIT 3;
		elseif NOT(i IS null) then
			RETURN query 
				SELECT "h".id, "h".direccion, consultasporhospitalI(h.id, i) FROM "Hospital" as "h" 
				ORDER BY consultasporhospitalI(h.id, i)
				DESC
				LIMIT 3;
		elseif NOT(fi IS null) then
			RETURN query 
				SELECT "h".id, "h".direccion, consultasporhospitalF(h.id, fi) FROM "Hospital" as "h" 
				ORDER BY consultasporhospitalF(h.id, fi)
				DESC
				LIMIT 3;
		else
			RETURN query 
				SELECT "h".id, "h".direccion, consultasporhospital(h.id) FROM "Hospital" as "h" 
				ORDER BY consultasporhospital(h.id)
				DESC
				LIMIT 3;
		end if;
	END;
$$ LANGUAGE plpgsql;

SELECT "d".idHospital, "d".direccion, "d".numeroConsultas FROM demandaConsultaHospital() AS "d";

/*  PRIMER INCISO   */

/*  SEGUNDO INCISO  */

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

/*  SEGUNDO INCISO  */

/*  TERCER INCISO   */

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

/*  TERCER INCISO   */

/*  CUARTO INCISO   */

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

/*  CUARTO INCISO   */

/*  QUINTO INCISO   */

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

/*  QUINTO INCISO   */

/*  SEXTO INCISO    */

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

/*  SEXTO INCISO    */

/*  SEPTIMO INCISO   */

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

/*  SEPTIMO INCISO  */


/*  OCTAVO INCISO  */

CREATE OR REPLACE FUNCTION totalPago(idh integer, tipo integer)
RETURNS integer AS $$
	BEGIN
		RETURN (
			SELECT COUNT(*)
			FROM "HospitalizacionPaciente" AS "hp"
			INNER JOIN "FichaIngreso" as "fi"
				ON "hp".id = "fi".id
			WHERE "fi".hospital = idh
				AND "hp".tipo_pago = tipo
		) +
		(
			SELECT COUNT(*)
			FROM "Cirugia" AS "c"
			INNER JOIN "FichaIngreso" as "fi"
				ON "c".id = "fi".id
			WHERE "fi".hospital = idh
				AND "c".tipo_pago = tipo
		) +
		(
			SELECT COUNT(*)
			FROM "Consulta" AS "c"
			INNER JOIN "Clinica" as "cl"
				ON "c".clinica = "cl".numero_clinica
			WHERE "cl".hospital = idh
				AND "c".tipo_pago = tipo
		) +
		(
			SELECT COUNT(*)
			FROM "PacienteEmergencia" AS "pe"
			INNER JOIN "FichaIngreso" as "fi"
				ON "pe".ficha_ingreso = "fi".id
			WHERE "fi".hospital = idh
				AND "pe".tipo_pago = tipo
		);
	END;
$$ LANGUAGE plpgsql;

SELECT "h".id, "h".direccion, 
	totalPago("h".id, 1) as "pagos_contado",
	totalPago("h".id, 2) as "pagos_credito",
	totalPago("h".id, 3) as "pagos_debito"
FROM "Hospital" as "h"
;

/*  OCTAVO INCISO  */


/*  NOVENO INCISO  */

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

/*  NOVENO INCISO  */


/*  DECIMO INCISO  */

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

/*  DECIMO INCISO  */


/*  ONCEAVO INCISO  */

SELECT "h".id_hospital, "h".direccion,
	"h".ganancia_hospital
FROM gananciaTotalHospitalTiempo(null, null) as "h"
;

/*  ONCEAVO INCISO  */


/*  DOCEAVO INCISO  */

SELECT "h".id,
"h".direccion,
"pe".turno,
ROUND(AVG("pr".edad), 1) as "promedio_edad",
ROUND(AVG("pr".sexo::int), 2) as "promedio_hombres",
ROUND(100 - AVG("pr".sexo::int), 2) as "promedio_hombres"
FROM "PacienteEmergencia" as "pe"
INNER JOIN "Paciente" as "p"
	ON "pe".paciente = "p".no_expediente
INNER JOIN "PersonaRegistrada" as "pr"
	ON "p".persona = "pr".dpi
INNER JOIN "FichaIngreso" as "fi"
	ON "fi".id = "pe".ficha_ingreso
INNER JOIN "Hospital" as "h"
	ON "h".id = "fi".hospital
GROUP BY "pe".turno, "h".id
;

/*  DOCEAVO INCISO  */


/*  TRECEAVO INCISO  */

SELECT "h".id,
"h".direccion,
"ec".nombre,
Case 
	WHEN "pr".sexo THEN 'Hombre' 
	ELSE 'Mujer' 
END, 
COUNT(*) as "numero_consultas"
FROM "FichaCita" as "fc"
INNER JOIN "Hospital" as "h"
	ON "h".id = "fc".hospital
INNER JOIN "Paciente" as "p"
	ON "p".no_expediente = "fc".paciente
INNER JOIN "PersonaRegistrada" as "pr"
	ON "pr".dpi = "p".persona
INNER JOIN "MedicoConsulta" as "mc"
	ON "mc".medico = "fc".medico
INNER JOIN "EspecialidadConsulta" as "ec"
	ON "mc".especialidad = "ec".id
GROUP BY "h".id, "pr".sexo, "ec".id
ORDER BY "h".id
;

/*  TRECEAVO INCISO  */


/*  CATORCEAVO INCISO   */

SELECT "h".id,
ROUND(AVG("pe".cuotas), 2) as "cuotas_promedio"
FROM "PacienteEmergencia" as "pe"
INNER JOIN "FichaIngreso" as "fi"
 	ON "fi".id = "pe".ficha_ingreso
INNER JOIN "Hospital" as "h"
	ON "h".id = "fi".hospital
WHERE "pe".cuotas IS NOT NULL
GROUP BY "h".id
ORDER BY "h".id
;

CREATE OR REPLACE FUNCTION promedioCuotasConsulta(i date default null, f date default null)
RETURNS TABLE(id_hospital integer, promedio decimal) AS $$
	BEGIN
		IF i IS NOT NULL AND f IS NOT NULL THEN
			RETURN query 	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Consulta" as "c"
				INNER JOIN "Clinica" as "cl"
					ON "c".clinica = "cl".numero_clinica
				INNER JOIN "Hospital" as "h"
					ON "h".id = "cl".hospital
				WHERE "c".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
					AND f >= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF i IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Consulta" as "c"
				INNER JOIN "Clinica" as "cl"
					ON "c".clinica = "cl".numero_clinica
				INNER JOIN "Hospital" as "h"
					ON "h".id = "cl".hospital
				WHERE "c".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF f IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Consulta" as "c"
				INNER JOIN "Clinica" as "cl"
					ON "c".clinica = "cl".numero_clinica
				INNER JOIN "Hospital" as "h"
					ON "h".id = "cl".hospital
				WHERE "c".cuotas IS NOT NULL
					AND f >= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSE
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Consulta" as "c"
				INNER JOIN "Clinica" as "cl"
					ON "c".clinica = "cl".numero_clinica
				INNER JOIN "Hospital" as "h"
					ON "h".id = "cl".hospital
				WHERE "c".cuotas IS NOT NULL
				GROUP BY "h".id
				ORDER BY "h".id
			;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION promedioCuotasCirugia(i date default null, f date default null)
RETURNS TABLE(id_hospital integer, promedio decimal) AS $$
	BEGIN
		IF i IS NOT NULL AND f IS NOT NULL THEN
			RETURN query 	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Cirugia" as "c"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "c".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "c".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
					AND f >= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF i IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Cirugia" as "c"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "c".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "c".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF f IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Cirugia" as "c"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "c".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "c".cuotas IS NOT NULL
					AND f >= DATE(CONCAT("c".año,'/',"c".mes,'/',"c".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSE
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("c".cuotas), 2) as "cuotas_promedio"
				FROM "Cirugia" as "c"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "c".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "c".cuotas IS NOT NULL
				GROUP BY "h".id
				ORDER BY "h".id
			;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION promedioCuotasHospitalizacion(i date default null, f date default null)
RETURNS TABLE(id_hospital integer, promedio decimal) AS $$
	BEGIN
		IF i IS NOT NULL AND f IS NOT NULL THEN
			RETURN query 	
				SELECT "h".id,
				ROUND(AVG("hp".cuotas), 2) as "cuotas_promedio"
				FROM "HospitalizacionPaciente" as "hp"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "hp".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "hp".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
					AND f >= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF i IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("hp".cuotas), 2) as "cuotas_promedio"
				FROM "HospitalizacionPaciente" as "hp"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "hp".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "hp".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF f IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("hp".cuotas), 2) as "cuotas_promedio"
				FROM "HospitalizacionPaciente" as "hp"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "hp".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "hp".cuotas IS NOT NULL
					AND f >= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSE
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("hp".cuotas), 2) as "cuotas_promedio"
				FROM "HospitalizacionPaciente" as "hp"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "hp".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "hp".cuotas IS NOT NULL
				GROUP BY "h".id
				ORDER BY "h".id
			;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION promedioCuotasEmergencia(i date default null, f date default null)
RETURNS TABLE(id_hospital integer, promedio decimal) AS $$
	BEGIN
		IF i IS NOT NULL AND f IS NOT NULL THEN
			RETURN query 	
				SELECT "h".id,
				ROUND(AVG("pe".cuotas), 2) as "cuotas_promedio"
				FROM "PacienteEmergencia" as "pe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "pe".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "pe".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
					AND f >= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF i IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("pe".cuotas), 2) as "cuotas_promedio"
				FROM "PacienteEmergencia" as "pe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "pe".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "pe".cuotas IS NOT NULL
					AND i <= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSEIF f IS NOT NULL THEN
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("pe".cuotas), 2) as "cuotas_promedio"
				FROM "PacienteEmergencia" as "pe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "pe".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "pe".cuotas IS NOT NULL
					AND f >= DATE(CONCAT("fi".año,'/',"fi".mes,'/',"fi".dia))
				GROUP BY "h".id
				ORDER BY "h".id
			;
		ELSE
			RETURN query	
				SELECT "h".id,
				ROUND(AVG("pe".cuotas), 2) as "cuotas_promedio"
				FROM "PacienteEmergencia" as "pe"
				INNER JOIN "FichaIngreso" as "fi"
					ON "fi".id = "pe".ficha_ingreso
				INNER JOIN "Hospital" as "h"
					ON "h".id = "fi".hospital
				WHERE "pe".cuotas IS NOT NULL
				GROUP BY "h".id
				ORDER BY "h".id
			;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION promedioCuotas(i date default null, f date default null)
RETURNS TABLE(id_hospital integer, direccion varchar(30),
			 promedio_cuotas_consulta decimal, promedio_cuotas_cirugia decimal,
			 promedio_cuotas_emergencia decimal, promedio_cuotas_hospitalizacion decimal) AS $$
	BEGIN
			RETURN query 	
				SELECT "h".id, "h".direccion, 
					Case 
						When "c".promedio IS NULL Then 0
						ELse "c".promedio
					END as "promedio_cuotas_consulta",
					Case 
						When "ci".promedio IS NULL Then 0
						ELse "ci".promedio
					END as "promedio_cuotas_cirugia",
					Case 
						When "e".promedio IS NULL Then 0
						ELse "e".promedio
					END as "promedio_cuotas_emergencia",
					Case 
						When "ho".promedio IS NULL Then 0
						ELse "ho".promedio
					END as "promedio_cuotas_hospitalizacion"
				FROM "Hospital" as "h"
				LEFT JOIN promediocuotasconsulta(i, f) as "c"
					ON "h".id = "c".id_hospital
				LEFT JOIN promediocuotascirugia(i, f) as "ci"
					ON "h".id = "ci".id_hospital
				LEFT JOIN promediocuotasemergencia(i, f) as "e"
					ON "h".id = "e".id_hospital
				LEFT JOIN promediocuotashospitalizacion(i, f) as "ho"
					ON "h".id = "ho".id_hospital
				ORDER BY "h".id
				;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM promediocuotas(null, null);

/*  CATORCEAVO INCISO   */

