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
