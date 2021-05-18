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
