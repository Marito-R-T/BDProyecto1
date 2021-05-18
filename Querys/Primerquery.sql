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
