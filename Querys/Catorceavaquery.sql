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
