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
