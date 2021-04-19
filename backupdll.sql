--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpython3u; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpython3u WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpython3u; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpython3u IS 'PL/Python3U untrusted procedural language';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AgendamientoQuirurgico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AgendamientoQuirurgico" (
    preoperatoria integer NOT NULL,
    "año" integer NOT NULL,
    mes smallint NOT NULL,
    dia smallint NOT NULL,
    hora smallint NOT NULL,
    caracter character varying(30) NOT NULL,
    historia_clinica text NOT NULL,
    tiempo_estimado integer NOT NULL,
    tipo_anestecia character varying(30) NOT NULL,
    aceptada boolean NOT NULL
);


ALTER TABLE public."AgendamientoQuirurgico" OWNER TO marito;

--
-- Name: AntecedenteHeredofamiliar; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AntecedenteHeredofamiliar" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."AntecedenteHeredofamiliar" OWNER TO marito;

--
-- Name: AntecedenteNoPatologico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AntecedenteNoPatologico" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."AntecedenteNoPatologico" OWNER TO marito;

--
-- Name: AntecedentePatologico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AntecedentePatologico" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."AntecedentePatologico" OWNER TO marito;

--
-- Name: AsignacionAyudante; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AsignacionAyudante" (
    ayudante integer NOT NULL,
    cirugia integer NOT NULL
);


ALTER TABLE public."AsignacionAyudante" OWNER TO marito;

--
-- Name: AsignacionMedicoCirugia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."AsignacionMedicoCirugia" (
    medico integer NOT NULL,
    cirugia integer NOT NULL,
    tipo_cirugia integer NOT NULL
);


ALTER TABLE public."AsignacionMedicoCirugia" OWNER TO marito;

--
-- Name: Ayudante; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Ayudante" (
    dpi integer NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public."Ayudante" OWNER TO marito;

--
-- Name: CalificacionHospital; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."CalificacionHospital" (
    no_calificacion integer NOT NULL,
    hospital integer NOT NULL,
    calificacion smallint NOT NULL
);


ALTER TABLE public."CalificacionHospital" OWNER TO marito;

--
-- Name: CalificacionHospital_no_calificacion_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."CalificacionHospital_no_calificacion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CalificacionHospital_no_calificacion_seq" OWNER TO marito;

--
-- Name: CalificacionHospital_no_calificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."CalificacionHospital_no_calificacion_seq" OWNED BY public."CalificacionHospital".no_calificacion;


--
-- Name: ChequeoPreanestesico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ChequeoPreanestesico" (
    preoperatorio integer NOT NULL,
    clasificacion_riesgo character varying(30) NOT NULL,
    medico_clasificador integer NOT NULL,
    firma_medico character varying(25) NOT NULL,
    plan_anestecia text NOT NULL,
    medico_anestesista integer NOT NULL
);


ALTER TABLE public."ChequeoPreanestesico" OWNER TO marito;

--
-- Name: Cirugia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Cirugia" (
    id integer NOT NULL,
    ficha_ingreso integer NOT NULL,
    tipo integer NOT NULL,
    precio money NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL
);


ALTER TABLE public."Cirugia" OWNER TO marito;

--
-- Name: Cirugia_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Cirugia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cirugia_id_seq" OWNER TO marito;

--
-- Name: Cirugia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Cirugia_id_seq" OWNED BY public."Cirugia".id;


--
-- Name: Clinica; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Clinica" (
    numero_clinica integer NOT NULL,
    hospital integer NOT NULL
);


ALTER TABLE public."Clinica" OWNER TO marito;

--
-- Name: Clinica_numero_clinica_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Clinica_numero_clinica_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Clinica_numero_clinica_seq" OWNER TO marito;

--
-- Name: Clinica_numero_clinica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Clinica_numero_clinica_seq" OWNED BY public."Clinica".numero_clinica;


--
-- Name: CodigoEgreso; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."CodigoEgreso" (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL
);


ALTER TABLE public."CodigoEgreso" OWNER TO marito;

--
-- Name: CodigoEgreso_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."CodigoEgreso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CodigoEgreso_id_seq" OWNER TO marito;

--
-- Name: CodigoEgreso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."CodigoEgreso_id_seq" OWNED BY public."CodigoEgreso".id;


--
-- Name: Consulta; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Consulta" (
    cita integer NOT NULL,
    total money NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    referido boolean NOT NULL,
    proxima_cita integer,
    notas text NOT NULL,
    datos_interes text,
    clinica integer NOT NULL
);


ALTER TABLE public."Consulta" OWNER TO marito;

--
-- Name: DiagnosticoSecundario; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."DiagnosticoSecundario" (
    egreso integer NOT NULL,
    diagnostico character varying(100) NOT NULL
);


ALTER TABLE public."DiagnosticoSecundario" OWNER TO marito;

--
-- Name: Encargado; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Encargado" (
    persona integer NOT NULL,
    paciente integer NOT NULL,
    parentesco character varying(15) NOT NULL
);


ALTER TABLE public."Encargado" OWNER TO marito;

--
-- Name: EquipoQuirurgico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."EquipoQuirurgico" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    tipo integer NOT NULL,
    funcion integer NOT NULL
);


ALTER TABLE public."EquipoQuirurgico" OWNER TO marito;

--
-- Name: EspecialidadCirugia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."EspecialidadCirugia" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."EspecialidadCirugia" OWNER TO marito;

--
-- Name: EspecialidadCirugia_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."EspecialidadCirugia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EspecialidadCirugia_id_seq" OWNER TO marito;

--
-- Name: EspecialidadCirugia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."EspecialidadCirugia_id_seq" OWNED BY public."EspecialidadCirugia".id;


--
-- Name: EspecialidadConsulta; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."EspecialidadConsulta" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."EspecialidadConsulta" OWNER TO marito;

--
-- Name: EspecialidadConsulta_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."EspecialidadConsulta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EspecialidadConsulta_id_seq" OWNER TO marito;

--
-- Name: EspecialidadConsulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."EspecialidadConsulta_id_seq" OWNED BY public."EspecialidadConsulta".id;


--
-- Name: EstudioPrevio; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."EstudioPrevio" (
    estudio character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."EstudioPrevio" OWNER TO marito;

--
-- Name: ExploracionAbdomen; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionAbdomen" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);


ALTER TABLE public."ExploracionAbdomen" OWNER TO marito;

--
-- Name: ExploracionCabeza; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionCabeza" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);


ALTER TABLE public."ExploracionCabeza" OWNER TO marito;

--
-- Name: ExploracionCavidad; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionCavidad" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL,
    cavidad character varying(20) NOT NULL
);


ALTER TABLE public."ExploracionCavidad" OWNER TO marito;

--
-- Name: ExploracionColumna; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionColumna" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);


ALTER TABLE public."ExploracionColumna" OWNER TO marito;

--
-- Name: ExploracionCuello; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionCuello" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);


ALTER TABLE public."ExploracionCuello" OWNER TO marito;

--
-- Name: ExploracionExtremidad; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionExtremidad" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL,
    extremidad character(25) NOT NULL
);


ALTER TABLE public."ExploracionExtremidad" OWNER TO marito;

--
-- Name: ExploracionTorax; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ExploracionTorax" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);


ALTER TABLE public."ExploracionTorax" OWNER TO marito;

--
-- Name: FichaCita; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FichaCita" (
    id integer NOT NULL,
    paciente integer NOT NULL,
    medico integer NOT NULL,
    reprogramada integer,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL,
    cancelada boolean NOT NULL,
    realizada boolean NOT NULL,
    hospital integer NOT NULL
);


ALTER TABLE public."FichaCita" OWNER TO marito;

--
-- Name: FichaCita_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."FichaCita_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FichaCita_id_seq" OWNER TO marito;

--
-- Name: FichaCita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."FichaCita_id_seq" OWNED BY public."FichaCita".id;


--
-- Name: FichaEgreso; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FichaEgreso" (
    id_ficha integer NOT NULL,
    diagnostico_principal character varying(150) NOT NULL,
    motivo_egreso character varying(150) NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL,
    camilla_asignado integer NOT NULL,
    codigo_egreso integer NOT NULL,
    consentido boolean NOT NULL,
    motivo character varying(100) NOT NULL,
    dias_hospitalizacion integer NOT NULL,
    referido boolean NOT NULL
);


ALTER TABLE public."FichaEgreso" OWNER TO marito;

--
-- Name: FichaIngreso; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FichaIngreso" (
    id integer NOT NULL,
    hospital integer NOT NULL,
    paciente integer NOT NULL,
    encargado integer,
    motivo text NOT NULL,
    unidad_medica integer NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL,
    medico_encargado integer NOT NULL,
    camilla_asignado integer NOT NULL,
    diagnostico_presuntivo character varying NOT NULL
);


ALTER TABLE public."FichaIngreso" OWNER TO marito;

--
-- Name: FichaIngreso_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."FichaIngreso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FichaIngreso_id_seq" OWNER TO marito;

--
-- Name: FichaIngreso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."FichaIngreso_id_seq" OWNED BY public."FichaIngreso".id;


--
-- Name: FichaTraslado; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FichaTraslado" (
    ingreso integer NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL,
    consentido boolean NOT NULL,
    unidad_origen integer NOT NULL,
    hospital_origen integer NOT NULL,
    unidad_destino integer NOT NULL,
    hospital_destino integer NOT NULL,
    ficha_ingreso_siguiente integer NOT NULL,
    medico integer NOT NULL
);


ALTER TABLE public."FichaTraslado" OWNER TO marito;

--
-- Name: FuncionEquipo; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FuncionEquipo" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."FuncionEquipo" OWNER TO marito;

--
-- Name: FuncionInstrumento; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."FuncionInstrumento" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."FuncionInstrumento" OWNER TO marito;

--
-- Name: Hospital; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Hospital" (
    id integer NOT NULL,
    informacion_especifica text NOT NULL,
    telefono character(8)[] NOT NULL,
    direccion character varying(30) NOT NULL
);


ALTER TABLE public."Hospital" OWNER TO marito;

--
-- Name: Hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Hospital_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Hospital_id_seq" OWNER TO marito;

--
-- Name: Hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Hospital_id_seq" OWNED BY public."Hospital".id;


--
-- Name: HospitalizacionPaciente; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."HospitalizacionPaciente" (
    id integer NOT NULL,
    ficha_ingreso integer NOT NULL,
    costo money NOT NULL,
    dias_internado integer NOT NULL,
    cancelado boolean NOT NULL,
    cuotas smallint NOT NULL
);


ALTER TABLE public."HospitalizacionPaciente" OWNER TO marito;

--
-- Name: HospitalizacionPaciente_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."HospitalizacionPaciente_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HospitalizacionPaciente_id_seq" OWNER TO marito;

--
-- Name: HospitalizacionPaciente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."HospitalizacionPaciente_id_seq" OWNED BY public."HospitalizacionPaciente".id;


--
-- Name: Instrumento; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Instrumento" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    tipo integer NOT NULL,
    funcion integer NOT NULL
);


ALTER TABLE public."Instrumento" OWNER TO marito;

--
-- Name: Insumo; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Insumo" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    material character varying(50) NOT NULL,
    tipo integer NOT NULL
);


ALTER TABLE public."Insumo" OWNER TO marito;

--
-- Name: InsumoHospitalizacion; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."InsumoHospitalizacion" (
    hospitalizacion_paciente integer NOT NULL,
    descripcion character varying(200) NOT NULL,
    precio money NOT NULL
);


ALTER TABLE public."InsumoHospitalizacion" OWNER TO marito;

--
-- Name: Intraoperatorio; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Intraoperatorio" (
    cirugia integer NOT NULL,
    presencia_completa integer NOT NULL,
    traslado_correcto integer NOT NULL,
    posicionamiento_correcto integer NOT NULL,
    placa_instalada integer NOT NULL,
    confirmacion_equipo integer NOT NULL,
    confirmacion_paciente integer NOT NULL,
    confirmacion_buena_condicion integer NOT NULL,
    revision integer NOT NULL,
    configuracion_suministro integer NOT NULL,
    plan_quirurgico text NOT NULL,
    incision integer NOT NULL,
    registro_balance text NOT NULL,
    registro_seguridad text NOT NULL,
    registro_transfusion text NOT NULL,
    fin_procedimiento boolean NOT NULL,
    confirmacion_efectividad boolean NOT NULL,
    confirmacion_conteo_instrumental boolean NOT NULL,
    cierre_incision boolean NOT NULL
);


ALTER TABLE public."Intraoperatorio" OWNER TO marito;

--
-- Name: Medicamento; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Medicamento" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    precio money NOT NULL
);


ALTER TABLE public."Medicamento" OWNER TO marito;

--
-- Name: Medicamento_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Medicamento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Medicamento_id_seq" OWNER TO marito;

--
-- Name: Medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Medicamento_id_seq" OWNED BY public."Medicamento".id;


--
-- Name: MedicoCirugia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."MedicoCirugia" (
    medico integer NOT NULL,
    especialidad integer NOT NULL
);


ALTER TABLE public."MedicoCirugia" OWNER TO marito;

--
-- Name: MedicoConsulta; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."MedicoConsulta" (
    medico integer NOT NULL,
    especialidad integer NOT NULL
);


ALTER TABLE public."MedicoConsulta" OWNER TO marito;

--
-- Name: Paciente; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Paciente" (
    no_expediente integer NOT NULL,
    persona integer NOT NULL
);


ALTER TABLE public."Paciente" OWNER TO marito;

--
-- Name: PacienteEmergencia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."PacienteEmergencia" (
    id integer NOT NULL,
    paciente integer NOT NULL,
    estado character varying(50) NOT NULL,
    ficha_ingreso integer NOT NULL,
    prioridad smallint NOT NULL,
    turno integer NOT NULL,
    consentimiento_info boolean NOT NULL,
    total money NOT NULL,
    cuotas smallint NOT NULL
);


ALTER TABLE public."PacienteEmergencia" OWNER TO marito;

--
-- Name: PacienteEmergencia_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."PacienteEmergencia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PacienteEmergencia_id_seq" OWNER TO marito;

--
-- Name: PacienteEmergencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."PacienteEmergencia_id_seq" OWNED BY public."PacienteEmergencia".id;


--
-- Name: Paciente_no_expediente_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Paciente_no_expediente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Paciente_no_expediente_seq" OWNER TO marito;

--
-- Name: Paciente_no_expediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Paciente_no_expediente_seq" OWNED BY public."Paciente".no_expediente;


--
-- Name: Patologia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Patologia" (
    paciente_emergencia integer NOT NULL,
    informacion character varying(100) NOT NULL
);


ALTER TABLE public."Patologia" OWNER TO marito;

--
-- Name: PersonaRegistrada; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."PersonaRegistrada" (
    dpi integer NOT NULL,
    nombres character varying(20) NOT NULL,
    apellidos character varying(20) NOT NULL,
    telefono character varying(8) NOT NULL,
    municipio character varying(20),
    departamento character varying(20) NOT NULL,
    area character varying(20),
    fecha_nacimiento date NOT NULL,
    edad smallint NOT NULL
);


ALTER TABLE public."PersonaRegistrada" OWNER TO marito;

--
-- Name: Personal; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Personal" (
    persona integer NOT NULL,
    tipo integer NOT NULL,
    hospital integer NOT NULL
);


ALTER TABLE public."Personal" OWNER TO marito;

--
-- Name: Postoperatorio; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Postoperatorio" (
    cirugia integer NOT NULL,
    condicion_evolucion character varying(50) NOT NULL,
    confirmacion_tipo_cama boolean NOT NULL,
    disposicion_cama boolean NOT NULL,
    disposicion_gases boolean NOT NULL,
    disposicion_bombas boolean NOT NULL,
    disposicion_monitores boolean NOT NULL,
    disposicion_electrodos boolean NOT NULL,
    confirmacion_disposicion_personal boolean NOT NULL,
    disposicion_portasueros boolean NOT NULL,
    tiempo_estimado integer NOT NULL,
    ficha_traslado integer,
    signos_vitales character varying(50) NOT NULL,
    zona_operatorio_limpio boolean NOT NULL,
    sueros_correctos boolean NOT NULL
);


ALTER TABLE public."Postoperatorio" OWNER TO marito;

--
-- Name: Preoperatoria; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Preoperatoria" (
    cirugia integer NOT NULL,
    padecimiento_actual character varying(100) NOT NULL,
    exploracion_general text NOT NULL,
    objetivo text NOT NULL,
    firma_medico character varying(15) NOT NULL,
    fecha_consentimiento date NOT NULL,
    tabla_disponible boolean NOT NULL,
    equipos_preparados boolean NOT NULL,
    paciente_ingresado boolean NOT NULL,
    confirmacion_arsenal boolean NOT NULL,
    medicamentos_disponibles boolean NOT NULL
);


ALTER TABLE public."Preoperatoria" OWNER TO marito;

--
-- Name: Prescripcion; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Prescripcion" (
    consulta integer NOT NULL,
    medicamento integer NOT NULL,
    dosis character varying(200) NOT NULL,
    duracion character varying(50) NOT NULL,
    cantidad_total integer NOT NULL
);


ALTER TABLE public."Prescripcion" OWNER TO marito;

--
-- Name: Procedimiento; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Procedimiento" (
    chequeo_consentimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    caracteristicas character varying(200)[] NOT NULL,
    riesgos character varying(150)[] NOT NULL,
    objetivo character varying(150) NOT NULL,
    persona_autorizacion integer,
    medico integer NOT NULL,
    tipo_procedimiento integer NOT NULL
);


ALTER TABLE public."Procedimiento" OWNER TO marito;

--
-- Name: ProcedimientoDiagnostico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ProcedimientoDiagnostico" (
    diagnostico character varying(150) NOT NULL,
    paciente_emergencia integer NOT NULL,
    procedimiento text NOT NULL
);


ALTER TABLE public."ProcedimientoDiagnostico" OWNER TO marito;

--
-- Name: ProcesoQuirurgico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ProcesoQuirurgico" (
    paciente_emergencia integer NOT NULL,
    proceso_quirurgico character varying(50) NOT NULL
);


ALTER TABLE public."ProcesoQuirurgico" OWNER TO marito;

--
-- Name: ProcesoTerapeutico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ProcesoTerapeutico" (
    paciente_emergencia integer NOT NULL,
    proceso_terapeutico character varying(100) NOT NULL
);


ALTER TABLE public."ProcesoTerapeutico" OWNER TO marito;

--
-- Name: Servicio; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."Servicio" (
    id integer NOT NULL,
    nombre character varying(70) NOT NULL
);


ALTER TABLE public."Servicio" OWNER TO marito;

--
-- Name: ServicioEmergencia; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ServicioEmergencia" (
    servicio integer NOT NULL,
    paciente_emergencia integer NOT NULL
);


ALTER TABLE public."ServicioEmergencia" OWNER TO marito;

--
-- Name: ServicioHospitalizacion; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ServicioHospitalizacion" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    costo_dia money NOT NULL
);


ALTER TABLE public."ServicioHospitalizacion" OWNER TO marito;

--
-- Name: ServicioHospitalizacion_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."ServicioHospitalizacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ServicioHospitalizacion_id_seq" OWNER TO marito;

--
-- Name: ServicioHospitalizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."ServicioHospitalizacion_id_seq" OWNED BY public."ServicioHospitalizacion".id;


--
-- Name: ServicioObtenido; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."ServicioObtenido" (
    hospitalizacion_paciente integer NOT NULL,
    servicio_hospitalizacion integer NOT NULL
);


ALTER TABLE public."ServicioObtenido" OWNER TO marito;

--
-- Name: Servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."Servicio_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Servicio_id_seq" OWNER TO marito;

--
-- Name: Servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."Servicio_id_seq" OWNED BY public."Servicio".id;


--
-- Name: SintomaAparato; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."SintomaAparato" (
    sintoma character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."SintomaAparato" OWNER TO marito;

--
-- Name: SintomaGeneral; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."SintomaGeneral" (
    sintoma character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);


ALTER TABLE public."SintomaGeneral" OWNER TO marito;

--
-- Name: TipoCondicion; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."TipoCondicion" (
    id integer NOT NULL,
    condicion character varying(50) NOT NULL
);


ALTER TABLE public."TipoCondicion" OWNER TO marito;

--
-- Name: TipoCondicion_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."TipoCondicion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TipoCondicion_id_seq" OWNER TO marito;

--
-- Name: TipoCondicion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."TipoCondicion_id_seq" OWNED BY public."TipoCondicion".id;


--
-- Name: TipoObjeto; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."TipoObjeto" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."TipoObjeto" OWNER TO marito;

--
-- Name: TipoPersonal; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."TipoPersonal" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE public."TipoPersonal" OWNER TO marito;

--
-- Name: TipoPersonal_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."TipoPersonal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TipoPersonal_id_seq" OWNER TO marito;

--
-- Name: TipoPersonal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."TipoPersonal_id_seq" OWNED BY public."TipoPersonal".id;


--
-- Name: TipoUnidad; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."TipoUnidad" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE public."TipoUnidad" OWNER TO marito;

--
-- Name: TipoUnidad_id_seq; Type: SEQUENCE; Schema: public; Owner: marito
--

CREATE SEQUENCE public."TipoUnidad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TipoUnidad_id_seq" OWNER TO marito;

--
-- Name: TipoUnidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marito
--

ALTER SEQUENCE public."TipoUnidad_id_seq" OWNED BY public."TipoUnidad".id;


--
-- Name: TurnoMedico; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."TurnoMedico" (
    medico integer NOT NULL,
    turno boolean NOT NULL,
    dia smallint NOT NULL
);


ALTER TABLE public."TurnoMedico" OWNER TO marito;

--
-- Name: UnidadHospital; Type: TABLE; Schema: public; Owner: marito
--

CREATE TABLE public."UnidadHospital" (
    id_hospital integer NOT NULL,
    tipo_unidad integer NOT NULL,
    informacion text NOT NULL
);


ALTER TABLE public."UnidadHospital" OWNER TO marito;

--
-- Name: CalificacionHospital no_calificacion; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."CalificacionHospital" ALTER COLUMN no_calificacion SET DEFAULT nextval('public."CalificacionHospital_no_calificacion_seq"'::regclass);


--
-- Name: Cirugia id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Cirugia" ALTER COLUMN id SET DEFAULT nextval('public."Cirugia_id_seq"'::regclass);


--
-- Name: Clinica numero_clinica; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Clinica" ALTER COLUMN numero_clinica SET DEFAULT nextval('public."Clinica_numero_clinica_seq"'::regclass);


--
-- Name: CodigoEgreso id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."CodigoEgreso" ALTER COLUMN id SET DEFAULT nextval('public."CodigoEgreso_id_seq"'::regclass);


--
-- Name: EspecialidadCirugia id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EspecialidadCirugia" ALTER COLUMN id SET DEFAULT nextval('public."EspecialidadCirugia_id_seq"'::regclass);


--
-- Name: EspecialidadConsulta id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EspecialidadConsulta" ALTER COLUMN id SET DEFAULT nextval('public."EspecialidadConsulta_id_seq"'::regclass);


--
-- Name: FichaCita id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita" ALTER COLUMN id SET DEFAULT nextval('public."FichaCita_id_seq"'::regclass);


--
-- Name: FichaIngreso id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso" ALTER COLUMN id SET DEFAULT nextval('public."FichaIngreso_id_seq"'::regclass);


--
-- Name: Hospital id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Hospital" ALTER COLUMN id SET DEFAULT nextval('public."Hospital_id_seq"'::regclass);


--
-- Name: HospitalizacionPaciente id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."HospitalizacionPaciente" ALTER COLUMN id SET DEFAULT nextval('public."HospitalizacionPaciente_id_seq"'::regclass);


--
-- Name: Medicamento id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Medicamento" ALTER COLUMN id SET DEFAULT nextval('public."Medicamento_id_seq"'::regclass);


--
-- Name: Paciente no_expediente; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Paciente" ALTER COLUMN no_expediente SET DEFAULT nextval('public."Paciente_no_expediente_seq"'::regclass);


--
-- Name: PacienteEmergencia id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."PacienteEmergencia" ALTER COLUMN id SET DEFAULT nextval('public."PacienteEmergencia_id_seq"'::regclass);


--
-- Name: Servicio id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Servicio" ALTER COLUMN id SET DEFAULT nextval('public."Servicio_id_seq"'::regclass);


--
-- Name: ServicioHospitalizacion id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioHospitalizacion" ALTER COLUMN id SET DEFAULT nextval('public."ServicioHospitalizacion_id_seq"'::regclass);


--
-- Name: TipoCondicion id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoCondicion" ALTER COLUMN id SET DEFAULT nextval('public."TipoCondicion_id_seq"'::regclass);


--
-- Name: TipoPersonal id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoPersonal" ALTER COLUMN id SET DEFAULT nextval('public."TipoPersonal_id_seq"'::regclass);


--
-- Name: TipoUnidad id; Type: DEFAULT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoUnidad" ALTER COLUMN id SET DEFAULT nextval('public."TipoUnidad_id_seq"'::regclass);


--
-- Data for Name: AgendamientoQuirurgico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AgendamientoQuirurgico" (preoperatoria, "año", mes, dia, hora, caracter, historia_clinica, tiempo_estimado, tipo_anestecia, aceptada) FROM stdin;
1	2021	12	2	18	caracter1	historia clinica de la primer cirugia	4	general	t
2	2021	20	2	18	caracter2	historia clinica de la segunda cirugia	2	ninguna	t
\.


--
-- Data for Name: AntecedenteHeredofamiliar; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AntecedenteHeredofamiliar" (antecedente, interrogatorio) FROM stdin;
diabetes	1
hipertension	1
\.


--
-- Data for Name: AntecedenteNoPatologico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AntecedenteNoPatologico" (antecedente, interrogatorio) FROM stdin;
fumador	1
mala alimentacion	1
practica boxeo	2
practica deportes extremos	2
\.


--
-- Data for Name: AntecedentePatologico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AntecedentePatologico" (antecedente, interrogatorio) FROM stdin;
ataques diabeticos	1
esguince anterior	2
\.


--
-- Data for Name: AsignacionAyudante; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AsignacionAyudante" (ayudante, cirugia) FROM stdin;
666666666	1
666666666	2
777777777	1
777777777	2
\.


--
-- Data for Name: AsignacionMedicoCirugia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."AsignacionMedicoCirugia" (medico, cirugia, tipo_cirugia) FROM stdin;
123456789	1	1
987654321	2	2
\.


--
-- Data for Name: Ayudante; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Ayudante" (dpi, tipo) FROM stdin;
666666666	chequeador de equipo
777777777	chequeador de limpieza
\.


--
-- Data for Name: CalificacionHospital; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."CalificacionHospital" (no_calificacion, hospital, calificacion) FROM stdin;
1	1	5
2	2	4
3	3	4
4	2	3
5	5	1
\.


--
-- Data for Name: ChequeoPreanestesico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ChequeoPreanestesico" (preoperatorio, clasificacion_riesgo, medico_clasificador, firma_medico, plan_anestecia, medico_anestesista) FROM stdin;
\.


--
-- Data for Name: Cirugia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Cirugia" (id, ficha_ingreso, tipo, precio, dia, mes, "año", hora) FROM stdin;
1	1	1	Q 500.00	12	2	2021	18
2	2	2	Q 500.00	20	2	2021	16
\.


--
-- Data for Name: Clinica; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Clinica" (numero_clinica, hospital) FROM stdin;
1	1
2	1
3	1
4	2
5	2
\.


--
-- Data for Name: CodigoEgreso; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."CodigoEgreso" (id, tipo) FROM stdin;
1	vivo
2	muerto
3	embarazo
4	parto
\.


--
-- Data for Name: Consulta; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Consulta" (cita, total, dia, mes, "año", referido, proxima_cita, notas, datos_interes, clinica) FROM stdin;
1	Q 500.00	15	2	2020	f	\N	nota de la primera consulta	datos interes	1
2	Q 500.00	15	2	2020	f	\N	nota de la segunda consulta	datos interes	2
3	Q 500.00	15	2	2020	f	\N	nota de la tercera consulta	datos interes	3
4	Q 500.00	15	2	2020	f	\N	nota de la cuarta consulta	datos interes	2
5	Q 500.00	15	2	2020	f	\N	nota de la quinta consulta	datos interes	1
6	Q 500.00	15	2	2020	f	\N	nota de la sexta consulta	datos interes	4
7	Q 500.00	15	2	2020	t	\N	nota de la septima consulta	datos interes	5
\.


--
-- Data for Name: DiagnosticoSecundario; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."DiagnosticoSecundario" (egreso, diagnostico) FROM stdin;
1	diagnosticosecundario1
1	diagnosticosecundario2
1	diagnosticosecundario3
1	diagnosticosecundario4
2	diagnosticosecundario1
2	diagnosticosecundario2
2	diagnosticosecundario3
2	diagnosticosecundario4
\.


--
-- Data for Name: Encargado; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Encargado" (persona, paciente, parentesco) FROM stdin;
123456789	12345678	esposo
777777777	12345680	hijo
666666666	12345679	madre
777777777	12345678	padre
444444444	12345681	hermano
\.


--
-- Data for Name: EquipoQuirurgico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."EquipoQuirurgico" (agendamiento, nombre, descripcion, tipo, funcion) FROM stdin;
1	equipo1	descripcion del equipo 1	1	2
1	equipo2	descripcion del equipo 2	2	3
1	equipo3	descripcion del equipo 3	3	3
1	equipo4	descripcion del equipo 4	3	4
2	equipo1	descripcion del equipo 3	3	4
2	equipo2	descripcion del equipo 4	3	3
1	instrumento1	descripcion del instrumento 1	1	2
1	instrumento2	descripcion del instrumento 2	2	3
1	instrumento3	descripcion del instrumento 3	3	1
1	instrumento4	descripcion del instrumento 4	2	4
2	instrumento2	descripcion del instrumento 2	3	3
2	instrumento3	descripcion del instrumento 3	2	5
\.


--
-- Data for Name: EspecialidadCirugia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."EspecialidadCirugia" (id, nombre) FROM stdin;
1	Cardiovascular (Adulto y Pediátrica)
2	de la Mano
3	General
4	Video laparoscopia Quirúrgica
5	Ginecológica
6	Neurológica
7	Oftalmológica
8	Oncológica
9	Ortopédica
10	Otorrinolaringológica
11	Pediátrica
12	Plástica
13	Tórax
14	Urológica
\.


--
-- Data for Name: EspecialidadConsulta; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."EspecialidadConsulta" (id, nombre) FROM stdin;
1	Cardiología
2	Dermatología
3	Fisioterapia
4	Ginecología Oncológica
5	Hematología
6	Medicina Física y Rehabilitación
7	Medicina General
8	Nutrición y Dietética
9	Odontología General
10	Oftalmología
11	Psicología
12	Pediatría
13	Urología
14	Terapia del Lenguaje
\.


--
-- Data for Name: EstudioPrevio; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."EstudioPrevio" (estudio, interrogatorio) FROM stdin;
presion alta	1
azucar elevado	1
colesterol elevado	1
esguince del brazo derecho	2
\.


--
-- Data for Name: ExploracionAbdomen; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionAbdomen" (dato_encontrado, exploracion_fisica) FROM stdin;
datoabdomen1	2
datoabdomen2	2
datoabdomen3	2
datoabdomen4	2
datoabdomen1	1
\.


--
-- Data for Name: ExploracionCabeza; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionCabeza" (dato_encontrado, exploracion_fisica) FROM stdin;
datocabeza1	1
datocabeza2	1
datocabeza3	1
datocabeza4	1
datocabeza1	2
\.


--
-- Data for Name: ExploracionCavidad; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionCavidad" (dato_encontrado, exploracion_fisica, cavidad) FROM stdin;
\.


--
-- Data for Name: ExploracionColumna; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionColumna" (dato_encontrado, exploracion_fisica) FROM stdin;
datocolumna1	2
datocolumna2	2
datocolumna3	2
datocolumna4	2
datocolumna1	1
\.


--
-- Data for Name: ExploracionCuello; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionCuello" (dato_encontrado, exploracion_fisica) FROM stdin;
datocuello1	1
datocuello2	1
datocuello1	2
datocuello2	2
datocuello3	2
\.


--
-- Data for Name: ExploracionExtremidad; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionExtremidad" (dato_encontrado, exploracion_fisica, extremidad) FROM stdin;
datoextremidad1	2	mano derecha             
datoextremidad2	2	mano derecha             
datoextremidad3	2	mano izquierda           
datoextremidad4	2	mano izquierda           
datoextremidad5	2	brazo derecho            
datocavidad1	1	boca                     
datocavidad2	1	boca                     
datocavidad3	1	boca                     
datocavidad4	1	nariz                    
datocavidad5	1	ano                      
\.


--
-- Data for Name: ExploracionTorax; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ExploracionTorax" (dato_encontrado, exploracion_fisica) FROM stdin;
datotorax1	2
datotorax2	2
datotorax1	1
datotorax2	1
datotorax3	1
\.


--
-- Data for Name: FichaCita; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FichaCita" (id, paciente, medico, reprogramada, dia, mes, "año", hora, cancelada, realizada, hospital) FROM stdin;
1	12345678	444444444	\N	15	2	2020	20	f	t	1
2	12345678	444444444	\N	15	3	2020	20	f	t	1
3	12345678	444444444	\N	15	4	2020	20	f	t	1
4	12345679	123456789	\N	10	3	2020	20	f	t	1
5	12345680	123456789	\N	20	3	2020	20	f	t	1
6	12345681	987654321	\N	28	5	2020	20	f	t	2
7	12345682	987654321	\N	1	1	2021	20	f	t	2
\.


--
-- Data for Name: FichaEgreso; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FichaEgreso" (id_ficha, diagnostico_principal, motivo_egreso, dia, mes, "año", hora, camilla_asignado, codigo_egreso, consentido, motivo, dias_hospitalizacion, referido) FROM stdin;
1	ataque de diabetes	nivelación del azucar	17	2	2021	12	1	1	t	mejora de salud	5	f
2	quebradura de la mano	clavos puestos	22	2	2021	6	3	1	t	mejora de salud	2	t
3	Mejoramiento de la persona	nivelación de la oxigenacion	23	2	2021	18	1	1	t	mejora de salud	6	f
4	Mejoramiento de la persona	mejoramiento del dolor	23	2	2021	12	1	1	t	mejora de salud	1	t
5	Mejoramiento de la persona	niveles de signos mejoraron	22	2	2021	6	3	1	t	mejora de salud	4	t
\.


--
-- Data for Name: FichaIngreso; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FichaIngreso" (id, hospital, paciente, encargado, motivo, unidad_medica, dia, mes, "año", hora, medico_encargado, camilla_asignado, diagnostico_presuntivo) FROM stdin;
1	3	12345680	\N	MOTIVO 1	4	12	2	2021	12	123456789	1	diagnostico
2	3	12345681	\N	MOTIVO 2	4	20	2	2021	10	444444444	3	diagnostico
3	3	12345680	\N	MOTIVO 3	1	12	8	2021	22	123456789	1	diagnostico
4	4	12345681	\N	MOTIVO 4	1	2	5	2021	18	987654321	5	diagnostico
5	4	12345682	\N	MOTIVO 5	3	21	3	2021	13	987654321	1	diagnostico
\.


--
-- Data for Name: FichaTraslado; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FichaTraslado" (ingreso, dia, mes, "año", hora, consentido, unidad_origen, hospital_origen, unidad_destino, hospital_destino, ficha_ingreso_siguiente, medico) FROM stdin;
1	17	2	2021	8	t	4	3	1	3	3	123456789
2	22	2	2021	6	t	4	3	1	3	4	987654321
\.


--
-- Data for Name: FuncionEquipo; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FuncionEquipo" (id, nombre) FROM stdin;
1	exploración
2	diagnóstico
3	tratamiento
4	rehabilitación
5	otro
\.


--
-- Data for Name: FuncionInstrumento; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."FuncionInstrumento" (id, nombre) FROM stdin;
1	corte
2	contenido
3	hemostática
4	retractor
5	accesorio
6	implante
7	otro
\.


--
-- Data for Name: Hospital; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Hospital" (id, informacion_especifica, telefono, direccion) FROM stdin;
1	hospital numero 1	{12345678}	Hospitaldireccion1
2	hospital numero 2	{12345678}	Hospitaldireccion2
3	hospital numero 3	{12345678}	Hospitaldireccion3
4	hospital numero 4	{12345678}	Hospitaldireccion4
5	hospital numero 5	{12345678}	Hospitaldireccion5
\.


--
-- Data for Name: HospitalizacionPaciente; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."HospitalizacionPaciente" (id, ficha_ingreso, costo, dias_internado, cancelado, cuotas) FROM stdin;
2	4	Q 1,000.00	1	t	1
1	3	Q 8,000.00	6	t	4
\.


--
-- Data for Name: Instrumento; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Instrumento" (agendamiento, nombre, descripcion, tipo, funcion) FROM stdin;
\.


--
-- Data for Name: Insumo; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Insumo" (agendamiento, nombre, descripcion, material, tipo) FROM stdin;
1	insumo1	descripcion del insumo 1	plastico	1
1	insumo2	descripcion del insumo 2	metal	2
1	insumo3	descripcion del insumo 3	metal	3
1	insumo4	descripcion del insumo 4	plastico	3
2	insumo3	descripcion del insumo 3	metal	3
2	insumo4	descripcion del insumo 4	plastico	3
\.


--
-- Data for Name: InsumoHospitalizacion; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."InsumoHospitalizacion" (hospitalizacion_paciente, descripcion, precio) FROM stdin;
1	descripcion del insumo 1	Q 500.00
1	descripcion del insumo 2	Q 500.00
1	descripcion del insumo 3	Q 500.00
1	descripcion del insumo 4	Q 500.00
\.


--
-- Data for Name: Intraoperatorio; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Intraoperatorio" (cirugia, presencia_completa, traslado_correcto, posicionamiento_correcto, placa_instalada, confirmacion_equipo, confirmacion_paciente, confirmacion_buena_condicion, revision, configuracion_suministro, plan_quirurgico, incision, registro_balance, registro_seguridad, registro_transfusion, fin_procedimiento, confirmacion_efectividad, confirmacion_conteo_instrumental, cierre_incision) FROM stdin;
1	1	1	2	1	1	2	1	2	3	plan quirurgico 1	1	registro balance 1	registro seguridad 1	registro transfusion 1	t	t	t	t
2	1	2	2	1	1	1	3	2	1	plan quirurgico 2	1	registro balance 2	registro seguridad 2	registro transfusion 2	t	t	t	t
\.


--
-- Data for Name: Medicamento; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Medicamento" (id, nombre, precio) FROM stdin;
1	medicamento1	Q 50.00
2	medicamento2	Q 45.00
3	medicamento3	Q 40.00
4	medicamento4	Q 15.00
5	medicamento5	Q 22.50
\.


--
-- Data for Name: MedicoCirugia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."MedicoCirugia" (medico, especialidad) FROM stdin;
123456789	1
987654321	2
444444444	3
\.


--
-- Data for Name: MedicoConsulta; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."MedicoConsulta" (medico, especialidad) FROM stdin;
123456789	1
987654321	2
444444444	3
\.


--
-- Data for Name: Paciente; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Paciente" (no_expediente, persona) FROM stdin;
12345678	123456789
12345679	444444444
12345680	666666666
12345681	777777777
12345682	777778555
\.


--
-- Data for Name: PacienteEmergencia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."PacienteEmergencia" (id, paciente, estado, ficha_ingreso, prioridad, turno, consentimiento_info, total, cuotas) FROM stdin;
1	12345682	estado critico	5	1	1	t	Q 3,000.00	2
\.


--
-- Data for Name: Patologia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Patologia" (paciente_emergencia, informacion) FROM stdin;
1	patología1
1	patología2
1	patología3
1	patología4
1	patología5
\.


--
-- Data for Name: PersonaRegistrada; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."PersonaRegistrada" (dpi, nombres, apellidos, telefono, municipio, departamento, area, fecha_nacimiento, edad) FROM stdin;
123456789	persona1	apellido1	45678912	municipio1	departamento1	area1	2020-02-15	15
777778555	persona1	apellido1	45678912	municipio1	departamento1	area1	2020-02-15	15
987654321	persona2	apellido2	45678913	municipio1	departamento3	area2	2000-02-14	15
666666666	persona2	apellido1	45678914	municipio2	departamento4	area3	2000-02-15	15
444444444	persona2	apellido4	45678915	municipio3	departamento5	area4	2001-02-16	15
777777777	persona2	apellido3	45678916	municipio4	departamento6	area5	2010-02-17	15
\.


--
-- Data for Name: Personal; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Personal" (persona, tipo, hospital) FROM stdin;
123456789	1	1
777777777	2	3
444444444	1	1
666666666	2	3
987654321	1	1
\.


--
-- Data for Name: Postoperatorio; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Postoperatorio" (cirugia, condicion_evolucion, confirmacion_tipo_cama, disposicion_cama, disposicion_gases, disposicion_bombas, disposicion_monitores, disposicion_electrodos, confirmacion_disposicion_personal, disposicion_portasueros, tiempo_estimado, ficha_traslado, signos_vitales, zona_operatorio_limpio, sueros_correctos) FROM stdin;
1	media condicion	t	t	t	t	t	t	t	t	5	1	estables	t	t
2	buena condicion	t	t	t	t	t	t	t	t	2	2	estables	t	t
\.


--
-- Data for Name: Preoperatoria; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Preoperatoria" (cirugia, padecimiento_actual, exploracion_general, objetivo, firma_medico, fecha_consentimiento, tabla_disponible, equipos_preparados, paciente_ingresado, confirmacion_arsenal, medicamentos_disponibles) FROM stdin;
1	dolor intenso del corazon	exploracion general 1	objetivo 1	firma1	2021-02-12	t	t	t	t	t
2	quebradura de mano	exploracion general 1	objetivo 1	firma1	2021-02-12	t	t	t	t	t
\.


--
-- Data for Name: Prescripcion; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Prescripcion" (consulta, medicamento, dosis, duracion, cantidad_total) FROM stdin;
1	1	en tableta 500 ml	1 semana	7
2	1	en tableta 500 ml	2 semana	14
2	3	una inyeccion de 1000 ml	3 días	3
3	4	en tableta 250 ml	1 semana	14
3	3	una inyeccion de 1000 ml	1 día	3
\.


--
-- Data for Name: Procedimiento; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Procedimiento" (chequeo_consentimiento, nombre, caracteristicas, riesgos, objetivo, persona_autorizacion, medico, tipo_procedimiento) FROM stdin;
1	procedimiento1	{caracteristica1,caracteristica2}	{riesgo1}	objetivo_procedimiento	\N	123456789	1
2	procedimiento2	{caracteristica1}	{riesgo1,riesgo2}	objetivo_procedimiento	\N	987654321	2
1	procedimiento2	{caracteristica1,caracteristica2}	{riesgo1}	objetivo_procedimiento	\N	123456789	1
1	procedimiento3	{caracteristica1,caracteristica2}	{riesgo1}	objetivo_procedimiento	\N	123456789	1
2	procedimiento1	{caracteristica1}	{riesgo1,riesgo2}	objetivo_procedimiento	\N	987654321	2
\.


--
-- Data for Name: ProcedimientoDiagnostico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ProcedimientoDiagnostico" (diagnostico, paciente_emergencia, procedimiento) FROM stdin;
diagnostico1	1	proceso1
diagnostico2	1	proceso2
diagnostico3	1	proceso3
diagnostico4	1	proceso1
diagnostico5	1	proceso2
\.


--
-- Data for Name: ProcesoQuirurgico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ProcesoQuirurgico" (paciente_emergencia, proceso_quirurgico) FROM stdin;
1	procesoquirurgico1
1	procesoquirurgico2
1	procesoquirurgico3
1	procesoquirurgico4
1	procesoquirurgico5
\.


--
-- Data for Name: ProcesoTerapeutico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ProcesoTerapeutico" (paciente_emergencia, proceso_terapeutico) FROM stdin;
1	procesoterapeutico1
1	procesoterapeutico2
1	procesoterapeutico3
1	procesoterapeutico4
1	procesoterapeutico5
\.


--
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."Servicio" (id, nombre) FROM stdin;
1	Aislamiento y control de la vía aérea y ventilación
2	Control cardiocirculatorio
3	Atención de pacientes politraumatizado
4	Manejo, control y administración de drogas protocolizadas
5	Procedimientos de control y observación
6	Procedimientos terapéuticos/diagnósticos
7	Procedimientos diagnósticos
\.


--
-- Data for Name: ServicioEmergencia; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ServicioEmergencia" (servicio, paciente_emergencia) FROM stdin;
1	1
2	1
3	1
4	1
5	1
\.


--
-- Data for Name: ServicioHospitalizacion; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ServicioHospitalizacion" (id, nombre, costo_dia) FROM stdin;
1	Hematología	Q 500.00
2	Medicina interna	Q 500.00
3	Neumología	Q 500.00
4	Neurología	Q 500.00
5	Oncología	Q 500.00
6	Ortopedia	Q 500.00
7	Pediatría	Q 500.00
8	Unidad de cuidados intermedios	Q 500.00
9	Unidades de cuidado crítico de adultos	Q 500.00
\.


--
-- Data for Name: ServicioObtenido; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."ServicioObtenido" (hospitalizacion_paciente, servicio_hospitalizacion) FROM stdin;
1	1
1	2
2	3
2	4
\.


--
-- Data for Name: SintomaAparato; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."SintomaAparato" (sintoma, interrogatorio) FROM stdin;
subida del azucar a 200	1
colesterol arriba de lo normal	1
oxigenacion de 78	1
quebradura del hueso de la mano	2
desviación del hueso del dedo meñique	2
\.


--
-- Data for Name: SintomaGeneral; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."SintomaGeneral" (sintoma, interrogatorio) FROM stdin;
dificultad de respirar	1
colesterol alto	1
subida de azucar	1
hipertensión	1
dolor punzante en la mano	2
inmobilidad de la mano	2
hueso desviado de la mano	2
\.


--
-- Data for Name: TipoCondicion; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."TipoCondicion" (id, condicion) FROM stdin;
1	aceptable
2	medianamente aceptable
3	no aceptable
\.


--
-- Data for Name: TipoObjeto; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."TipoObjeto" (id, nombre) FROM stdin;
1	quirúrgico
2	médico
3	otro
\.


--
-- Data for Name: TipoPersonal; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."TipoPersonal" (id, nombre) FROM stdin;
1	Medico
2	Enfermero
3	Estudiante
4	Ayudante
\.


--
-- Data for Name: TipoUnidad; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."TipoUnidad" (id, nombre) FROM stdin;
1	Hospitalizacion
2	Consulta
3	Emergencia
4	Cirugia
\.


--
-- Data for Name: TurnoMedico; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."TurnoMedico" (medico, turno, dia) FROM stdin;
123456789	t	1
123456789	t	2
123456789	t	3
123456789	t	4
123456789	t	5
123456789	t	6
444444444	f	1
444444444	f	2
444444444	f	3
444444444	f	4
\.


--
-- Data for Name: UnidadHospital; Type: TABLE DATA; Schema: public; Owner: marito
--

COPY public."UnidadHospital" (id_hospital, tipo_unidad, informacion) FROM stdin;
1	1	habilitado
1	2	habilitado
1	3	habilitado
1	4	habilitado
2	1	no habilitado
2	2	habilitado
2	3	habilitado
2	4	habilitado
3	1	informacion hospitalizacion 3
3	4	informacion cirugia 3
\.


--
-- Name: CalificacionHospital_no_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."CalificacionHospital_no_calificacion_seq"', 5, true);


--
-- Name: Cirugia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Cirugia_id_seq"', 2, true);


--
-- Name: Clinica_numero_clinica_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Clinica_numero_clinica_seq"', 5, true);


--
-- Name: CodigoEgreso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."CodigoEgreso_id_seq"', 4, true);


--
-- Name: EspecialidadCirugia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."EspecialidadCirugia_id_seq"', 14, true);


--
-- Name: EspecialidadConsulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."EspecialidadConsulta_id_seq"', 14, true);


--
-- Name: FichaCita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."FichaCita_id_seq"', 7, true);


--
-- Name: FichaIngreso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."FichaIngreso_id_seq"', 5, true);


--
-- Name: Hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Hospital_id_seq"', 1, false);


--
-- Name: HospitalizacionPaciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."HospitalizacionPaciente_id_seq"', 2, true);


--
-- Name: Medicamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Medicamento_id_seq"', 1, false);


--
-- Name: PacienteEmergencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."PacienteEmergencia_id_seq"', 1, true);


--
-- Name: Paciente_no_expediente_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Paciente_no_expediente_seq"', 1, false);


--
-- Name: ServicioHospitalizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."ServicioHospitalizacion_id_seq"', 9, true);


--
-- Name: Servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."Servicio_id_seq"', 7, true);


--
-- Name: TipoCondicion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."TipoCondicion_id_seq"', 3, true);


--
-- Name: TipoPersonal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."TipoPersonal_id_seq"', 4, true);


--
-- Name: TipoUnidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marito
--

SELECT pg_catalog.setval('public."TipoUnidad_id_seq"', 1, false);


--
-- Name: AgendamientoQuirurgico AgendamientoQuirurgico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AgendamientoQuirurgico"
    ADD CONSTRAINT "AgendamientoQuirurgico_pkey" PRIMARY KEY (preoperatoria);


--
-- Name: AntecedenteHeredofamiliar AntecedenteHeredofamiliar_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedenteHeredofamiliar"
    ADD CONSTRAINT "AntecedenteHeredofamiliar_pkey" PRIMARY KEY (antecedente, interrogatorio);


--
-- Name: AntecedenteNoPatologico AntecedenteNoPatologico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedenteNoPatologico"
    ADD CONSTRAINT "AntecedenteNoPatologico_pkey" PRIMARY KEY (antecedente, interrogatorio);


--
-- Name: AntecedentePatologico AntecedentePatologico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedentePatologico"
    ADD CONSTRAINT "AntecedentePatologico_pkey" PRIMARY KEY (antecedente, interrogatorio);


--
-- Name: AsignacionAyudante AsignacionAyudante_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "AsignacionAyudante_pkey" PRIMARY KEY (ayudante, cirugia);


--
-- Name: AsignacionMedicoCirugia AsignacionMedicoCirugia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "AsignacionMedicoCirugia_pkey" PRIMARY KEY (medico, cirugia);


--
-- Name: Ayudante Ayudante_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Ayudante"
    ADD CONSTRAINT "Ayudante_pkey" PRIMARY KEY (dpi);


--
-- Name: CalificacionHospital CalificacionHospital_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."CalificacionHospital"
    ADD CONSTRAINT "CalificacionHospital_pkey" PRIMARY KEY (no_calificacion);


--
-- Name: ChequeoPreanestesico ChequeoPreanestesico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "ChequeoPreanestesico_pkey" PRIMARY KEY (preoperatorio);


--
-- Name: Cirugia Cirugia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "Cirugia_pkey" PRIMARY KEY (id);


--
-- Name: Clinica Clinica_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Clinica"
    ADD CONSTRAINT "Clinica_pkey" PRIMARY KEY (numero_clinica);


--
-- Name: CodigoEgreso CodigoEgreso_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."CodigoEgreso"
    ADD CONSTRAINT "CodigoEgreso_pkey" PRIMARY KEY (id);


--
-- Name: Consulta Consulta_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "Consulta_pkey" PRIMARY KEY (cita);


--
-- Name: DiagnosticoSecundario DiagnosticoSecundario_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."DiagnosticoSecundario"
    ADD CONSTRAINT "DiagnosticoSecundario_pkey" PRIMARY KEY (egreso, diagnostico);


--
-- Name: Encargado Encargado_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "Encargado_pkey" PRIMARY KEY (persona, paciente);


--
-- Name: EquipoQuirurgico EquipoQuirurgico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "EquipoQuirurgico_pkey" PRIMARY KEY (nombre, agendamiento);


--
-- Name: EspecialidadCirugia EspecialidadCirugia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EspecialidadCirugia"
    ADD CONSTRAINT "EspecialidadCirugia_pkey" PRIMARY KEY (id);


--
-- Name: EspecialidadConsulta EspecialidadConsulta_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EspecialidadConsulta"
    ADD CONSTRAINT "EspecialidadConsulta_pkey" PRIMARY KEY (id);


--
-- Name: EstudioPrevio EstudioPrevio_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EstudioPrevio"
    ADD CONSTRAINT "EstudioPrevio_pkey" PRIMARY KEY (estudio, interrogatorio);


--
-- Name: ExploracionAbdomen ExploracionAbdomen_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionAbdomen"
    ADD CONSTRAINT "ExploracionAbdomen_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: ExploracionCabeza ExploracionCabeza_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCabeza"
    ADD CONSTRAINT "ExploracionCabeza_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: ExploracionCavidad ExploracionCavidad_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCavidad"
    ADD CONSTRAINT "ExploracionCavidad_pkey" PRIMARY KEY (exploracion_fisica, dato_encontrado);


--
-- Name: ExploracionColumna ExploracionColumna_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionColumna"
    ADD CONSTRAINT "ExploracionColumna_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: ExploracionCuello ExploracionCuello_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCuello"
    ADD CONSTRAINT "ExploracionCuello_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: ExploracionExtremidad ExploracionExtremidad_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionExtremidad"
    ADD CONSTRAINT "ExploracionExtremidad_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: ExploracionTorax ExploracionTorax_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionTorax"
    ADD CONSTRAINT "ExploracionTorax_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);


--
-- Name: FichaCita FichaCita_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FichaCita_pkey" PRIMARY KEY (id);


--
-- Name: FichaEgreso FichaEgreso_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FichaEgreso_pkey" PRIMARY KEY (id_ficha);


--
-- Name: FichaIngreso FichaIngreso_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FichaIngreso_pkey" PRIMARY KEY (id);


--
-- Name: FichaTraslado FichaTraslado_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FichaTraslado_pkey" PRIMARY KEY (ingreso);


--
-- Name: FuncionEquipo FuncionEquipo_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FuncionEquipo"
    ADD CONSTRAINT "FuncionEquipo_pkey" PRIMARY KEY (id);


--
-- Name: FuncionInstrumento FuncionInstrumento_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FuncionInstrumento"
    ADD CONSTRAINT "FuncionInstrumento_pkey" PRIMARY KEY (id);


--
-- Name: Hospital Hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id);


--
-- Name: HospitalizacionPaciente HospitalizacionPaciente_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."HospitalizacionPaciente"
    ADD CONSTRAINT "HospitalizacionPaciente_pkey" PRIMARY KEY (id);


--
-- Name: Instrumento Instrumento_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "Instrumento_pkey" PRIMARY KEY (nombre, agendamiento);


--
-- Name: InsumoHospitalizacion InsumoHospitalizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."InsumoHospitalizacion"
    ADD CONSTRAINT "InsumoHospitalizacion_pkey" PRIMARY KEY (descripcion, hospitalizacion_paciente);


--
-- Name: Insumo Insumo_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "Insumo_pkey" PRIMARY KEY (nombre, agendamiento);


--
-- Name: Intraoperatorio Intraoperatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "Intraoperatorio_pkey" PRIMARY KEY (cirugia);


--
-- Name: Medicamento Medicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Medicamento"
    ADD CONSTRAINT "Medicamento_pkey" PRIMARY KEY (id);


--
-- Name: MedicoCirugia MedicoCirugia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "MedicoCirugia_pkey" PRIMARY KEY (medico, especialidad);


--
-- Name: MedicoConsulta MedicoConsulta_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "MedicoConsulta_pkey" PRIMARY KEY (medico);


--
-- Name: PacienteEmergencia PacienteEmergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "PacienteEmergencia_pkey" PRIMARY KEY (id);


--
-- Name: Paciente Paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (no_expediente);


--
-- Name: Patologia Patologia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Patologia"
    ADD CONSTRAINT "Patologia_pkey" PRIMARY KEY (paciente_emergencia, informacion);


--
-- Name: PersonaRegistrada PersonaRegistrada_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."PersonaRegistrada"
    ADD CONSTRAINT "PersonaRegistrada_pkey" PRIMARY KEY (dpi);


--
-- Name: Personal Personal_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "Personal_pkey" PRIMARY KEY (persona);


--
-- Name: Postoperatorio Postoperatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "Postoperatorio_pkey" PRIMARY KEY (cirugia);


--
-- Name: Preoperatoria Preoperatoria_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Preoperatoria"
    ADD CONSTRAINT "Preoperatoria_pkey" PRIMARY KEY (cirugia);


--
-- Name: Prescripcion Prescripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "Prescripcion_pkey" PRIMARY KEY (consulta, medicamento);


--
-- Name: ProcedimientoDiagnostico ProcedimientoDiagnostico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcedimientoDiagnostico"
    ADD CONSTRAINT "ProcedimientoDiagnostico_pkey" PRIMARY KEY (diagnostico, paciente_emergencia);


--
-- Name: Procedimiento Procedimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "Procedimiento_pkey" PRIMARY KEY (nombre, chequeo_consentimiento);


--
-- Name: ProcesoQuirurgico ProcesoQuirurgico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcesoQuirurgico"
    ADD CONSTRAINT "ProcesoQuirurgico_pkey" PRIMARY KEY (paciente_emergencia, proceso_quirurgico);


--
-- Name: ProcesoTerapeutico ProcesoTerapeutico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcesoTerapeutico"
    ADD CONSTRAINT "ProcesoTerapeutico_pkey" PRIMARY KEY (paciente_emergencia, proceso_terapeutico);


--
-- Name: ServicioEmergencia ServicioEmergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "ServicioEmergencia_pkey" PRIMARY KEY (servicio, paciente_emergencia);


--
-- Name: ServicioHospitalizacion ServicioHospitalizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioHospitalizacion"
    ADD CONSTRAINT "ServicioHospitalizacion_pkey" PRIMARY KEY (id);


--
-- Name: ServicioObtenido ServicioObtenido_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "ServicioObtenido_pkey" PRIMARY KEY (hospitalizacion_paciente, servicio_hospitalizacion);


--
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY (id);


--
-- Name: SintomaAparato SintomaAparato_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."SintomaAparato"
    ADD CONSTRAINT "SintomaAparato_pkey" PRIMARY KEY (interrogatorio, sintoma);


--
-- Name: SintomaGeneral SintomaGeneral_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."SintomaGeneral"
    ADD CONSTRAINT "SintomaGeneral_pkey" PRIMARY KEY (sintoma, interrogatorio);


--
-- Name: TipoCondicion TipoCondicion_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoCondicion"
    ADD CONSTRAINT "TipoCondicion_pkey" PRIMARY KEY (id);


--
-- Name: TipoObjeto TipoObjeto_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoObjeto"
    ADD CONSTRAINT "TipoObjeto_pkey" PRIMARY KEY (id);


--
-- Name: TipoPersonal TipoPersonal_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoPersonal"
    ADD CONSTRAINT "TipoPersonal_pkey" PRIMARY KEY (id);


--
-- Name: TipoUnidad TipoUnidad_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TipoUnidad"
    ADD CONSTRAINT "TipoUnidad_pkey" PRIMARY KEY (id);


--
-- Name: TurnoMedico TurnoMedico_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TurnoMedico"
    ADD CONSTRAINT "TurnoMedico_pkey" PRIMARY KEY (medico, dia);


--
-- Name: UnidadHospital UnidadHospital_pkey; Type: CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "UnidadHospital_pkey" PRIMARY KEY (id_hospital, tipo_unidad);


--
-- Name: EquipoQuirurgico FK_AGENDAMIENTO_EQUIPO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_AGENDAMIENTO_EQUIPO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);


--
-- Name: Instrumento FK_AGENDAMIENTO_INSTRUMENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_AGENDAMIENTO_INSTRUMENTO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);


--
-- Name: Insumo FK_AGENDAMIENTO_INSUMO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "FK_AGENDAMIENTO_INSUMO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);


--
-- Name: ChequeoPreanestesico FK_ANESTESISTA_CHEQUEO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_ANESTESISTA_CHEQUEO" FOREIGN KEY (medico_anestesista) REFERENCES public."Personal"(persona);


--
-- Name: Procedimiento FK_AUTORIZACION_PROCEDIMIENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_AUTORIZACION_PROCEDIMIENTO" FOREIGN KEY (persona_autorizacion) REFERENCES public."PersonaRegistrada"(dpi);


--
-- Name: AsignacionAyudante FK_AYUDANTE_ASIGNACIONA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "FK_AYUDANTE_ASIGNACIONA" FOREIGN KEY (ayudante) REFERENCES public."Ayudante"(dpi);


--
-- Name: Intraoperatorio FK_CCONDICION_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CCONDICION_INTRA" FOREIGN KEY (confirmacion_buena_condicion) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CCONF_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CCONF_INTRA" FOREIGN KEY (configuracion_suministro) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CEQUIPO_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CEQUIPO_INTRA" FOREIGN KEY (confirmacion_equipo) REFERENCES public."TipoCondicion"(id);


--
-- Name: Procedimiento FK_CHEQUEO_PROCEDIMIENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_CHEQUEO_PROCEDIMIENTO" FOREIGN KEY (chequeo_consentimiento) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: AgendamientoQuirurgico FK_CIRUGIA_AGENDAMIENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AgendamientoQuirurgico"
    ADD CONSTRAINT "FK_CIRUGIA_AGENDAMIENTO" FOREIGN KEY (preoperatoria) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: AsignacionMedicoCirugia FK_CIRUGIA_ASIGNACION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "FK_CIRUGIA_ASIGNACION" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);


--
-- Name: AsignacionAyudante FK_CIRUGIA_ASIGNACIONA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "FK_CIRUGIA_ASIGNACIONA" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);


--
-- Name: Intraoperatorio FK_CIRUGIA_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CIRUGIA_INTRA" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);


--
-- Name: Postoperatorio FK_CIRUGIA_POST; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "FK_CIRUGIA_POST" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);


--
-- Name: Preoperatoria FK_CIRUGIA_PREOPERATORIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Preoperatoria"
    ADD CONSTRAINT "FK_CIRUGIA_PREOPERATORIO" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);


--
-- Name: Consulta FK_CITA_CONSULTA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_CITA_CONSULTA" FOREIGN KEY (cita) REFERENCES public."FichaCita"(id);


--
-- Name: ChequeoPreanestesico FK_CLASIFICADOR_CHEQUEO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_CLASIFICADOR_CHEQUEO" FOREIGN KEY (medico_clasificador) REFERENCES public."Personal"(persona);


--
-- Name: Consulta FK_CLINICA_CONSULTA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_CLINICA_CONSULTA" FOREIGN KEY (clinica) REFERENCES public."Clinica"(numero_clinica);


--
-- Name: FichaEgreso FK_CODIGO_EGRESO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FK_CODIGO_EGRESO" FOREIGN KEY (codigo_egreso) REFERENCES public."CodigoEgreso"(id) NOT VALID;


--
-- Name: Prescripcion FK_CONSULTA_PRESCRIPCION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "FK_CONSULTA_PRESCRIPCION" FOREIGN KEY (medicamento) REFERENCES public."Medicamento"(id);


--
-- Name: Intraoperatorio FK_CPACIENTE_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPACIENTE_INTRA" FOREIGN KEY (confirmacion_paciente) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CPLACA_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPLACA_INTRA" FOREIGN KEY (placa_instalada) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CPOSICIONAMIENTO_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPOSICIONAMIENTO_INTRA" FOREIGN KEY (posicionamiento_correcto) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CPRESENCIA_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPRESENCIA_INTRA" FOREIGN KEY (presencia_completa) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CREVISION_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CREVISION_INTRA" FOREIGN KEY (revision) REFERENCES public."TipoCondicion"(id);


--
-- Name: Intraoperatorio FK_CTRASLADO_INTRA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CTRASLADO_INTRA" FOREIGN KEY (traslado_correcto) REFERENCES public."TipoCondicion"(id);


--
-- Name: FichaTraslado FK_DESTINO_TRASLADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_DESTINO_TRASLADO" FOREIGN KEY (hospital_destino, unidad_destino) REFERENCES public."UnidadHospital"(id_hospital, tipo_unidad);


--
-- Name: DiagnosticoSecundario FK_EGRESO_DIAGNOSTICO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."DiagnosticoSecundario"
    ADD CONSTRAINT "FK_EGRESO_DIAGNOSTICO" FOREIGN KEY (egreso) REFERENCES public."FichaEgreso"(id_ficha);


--
-- Name: FichaIngreso FK_ENCARGADO_FICHA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_ENCARGADO_FICHA" FOREIGN KEY (encargado, paciente) REFERENCES public."Encargado"(persona, paciente);


--
-- Name: Cirugia FK_ESPECIALIDAD_CIRUGIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "FK_ESPECIALIDAD_CIRUGIA" FOREIGN KEY (tipo) REFERENCES public."Cirugia"(id) NOT VALID;


--
-- Name: MedicoConsulta FK_ESPECIALIDAD_CONSULTA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "FK_ESPECIALIDAD_CONSULTA" FOREIGN KEY (especialidad) REFERENCES public."EspecialidadConsulta"(id);


--
-- Name: MedicoCirugia FK_ESPECIALIDAD_MEDICO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "FK_ESPECIALIDAD_MEDICO" FOREIGN KEY (especialidad) REFERENCES public."EspecialidadCirugia"(id);


--
-- Name: ExploracionAbdomen FK_EXPLO_ABDOMEN; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionAbdomen"
    ADD CONSTRAINT "FK_EXPLO_ABDOMEN" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionCabeza FK_EXPLO_CABEZA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCabeza"
    ADD CONSTRAINT "FK_EXPLO_CABEZA" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionCavidad FK_EXPLO_CAVIDAD; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCavidad"
    ADD CONSTRAINT "FK_EXPLO_CAVIDAD" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionColumna FK_EXPLO_COLUMNA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionColumna"
    ADD CONSTRAINT "FK_EXPLO_COLUMNA" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionCuello FK_EXPLO_CUELLO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionCuello"
    ADD CONSTRAINT "FK_EXPLO_CUELLO" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionExtremidad FK_EXPLO_EXTREMIDAD; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionExtremidad"
    ADD CONSTRAINT "FK_EXPLO_EXTREMIDAD" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: ExploracionTorax FK_EXPLO_TORAX; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ExploracionTorax"
    ADD CONSTRAINT "FK_EXPLO_TORAX" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: PacienteEmergencia FK_FICHA_EMERGENCIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "FK_FICHA_EMERGENCIA" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);


--
-- Name: HospitalizacionPaciente FK_FICHA_HOSPITALIZACION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."HospitalizacionPaciente"
    ADD CONSTRAINT "FK_FICHA_HOSPITALIZACION" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);


--
-- Name: EquipoQuirurgico FK_FUNCION_EQUIPO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_FUNCION_EQUIPO" FOREIGN KEY (funcion) REFERENCES public."FuncionEquipo"(id) NOT VALID;


--
-- Name: Instrumento FK_FUNCION_INSTRUMENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_FUNCION_INSTRUMENTO" FOREIGN KEY (funcion) REFERENCES public."FuncionInstrumento"(id);


--
-- Name: InsumoHospitalizacion FK_HOSPITALIZACION_INSUMO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."InsumoHospitalizacion"
    ADD CONSTRAINT "FK_HOSPITALIZACION_INSUMO" FOREIGN KEY (hospitalizacion_paciente) REFERENCES public."HospitalizacionPaciente"(id);


--
-- Name: ServicioObtenido FK_HOSPITALIZACION_SERVICIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "FK_HOSPITALIZACION_SERVICIO" FOREIGN KEY (hospitalizacion_paciente) REFERENCES public."HospitalizacionPaciente"(id);


--
-- Name: CalificacionHospital FK_HOSPITAL_CALIFICACION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."CalificacionHospital"
    ADD CONSTRAINT "FK_HOSPITAL_CALIFICACION" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);


--
-- Name: FichaCita FK_HOSPITAL_CITA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_HOSPITAL_CITA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id) NOT VALID;


--
-- Name: Clinica FK_HOSPITAL_CLINICA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Clinica"
    ADD CONSTRAINT "FK_HOSPITAL_CLINICA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);


--
-- Name: FichaIngreso FK_HOSPITAL_FICHA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_HOSPITAL_FICHA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);


--
-- Name: Personal FK_HOSPITAL_PERSONAL; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_HOSPITAL_PERSONAL" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);


--
-- Name: UnidadHospital FK_HOSPITAL_UNIDAD; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "FK_HOSPITAL_UNIDAD" FOREIGN KEY (id_hospital) REFERENCES public."Hospital"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Cirugia FK_INGRESO_CIRUGIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "FK_INGRESO_CIRUGIA" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);


--
-- Name: FichaEgreso FK_INGRESO_EGRESO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FK_INGRESO_EGRESO" FOREIGN KEY (id_ficha) REFERENCES public."FichaIngreso"(id);


--
-- Name: FichaTraslado FK_INGRESO_TRASLADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_INGRESO_TRASLADO" FOREIGN KEY (ingreso) REFERENCES public."FichaIngreso"(id);


--
-- Name: SintomaAparato FK_INTERROGATORIO_APARATO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."SintomaAparato"
    ADD CONSTRAINT "FK_INTERROGATORIO_APARATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: EstudioPrevio FK_INTERROGATORIO_ESTUDIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EstudioPrevio"
    ADD CONSTRAINT "FK_INTERROGATORIO_ESTUDIO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: SintomaGeneral FK_INTERROGATORIO_GENERAL; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."SintomaGeneral"
    ADD CONSTRAINT "FK_INTERROGATORIO_GENERAL" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: AntecedenteHeredofamiliar FK_INTERROGATORIO_HEREDO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedenteHeredofamiliar"
    ADD CONSTRAINT "FK_INTERROGATORIO_HEREDO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: AntecedenteNoPatologico FK_INTERROGATORIO_NPATO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedenteNoPatologico"
    ADD CONSTRAINT "FK_INTERROGATORIO_NPATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: AntecedentePatologico FK_INTERROGATORIO_PATO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AntecedentePatologico"
    ADD CONSTRAINT "FK_INTERROGATORIO_PATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: Prescripcion FK_MEDICAMENTO_PRESCRIPCION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "FK_MEDICAMENTO_PRESCRIPCION" FOREIGN KEY (consulta) REFERENCES public."Consulta"(cita);


--
-- Name: AsignacionMedicoCirugia FK_MEDICO_ASIGNACION; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "FK_MEDICO_ASIGNACION" FOREIGN KEY (medico, tipo_cirugia) REFERENCES public."MedicoCirugia"(medico, especialidad);


--
-- Name: MedicoCirugia FK_MEDICO_CIRUGIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "FK_MEDICO_CIRUGIA" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);


--
-- Name: FichaCita FK_MEDICO_CITA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_MEDICO_CITA" FOREIGN KEY (medico) REFERENCES public."MedicoConsulta"(medico) NOT VALID;


--
-- Name: FichaIngreso FK_MEDICO_FICHA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_MEDICO_FICHA" FOREIGN KEY (medico_encargado) REFERENCES public."Personal"(persona);


--
-- Name: Procedimiento FK_MEDICO_PROCEDIMIENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_MEDICO_PROCEDIMIENTO" FOREIGN KEY (medico, tipo_procedimiento) REFERENCES public."MedicoCirugia"(medico, especialidad);


--
-- Name: FichaTraslado FK_MEDICO_TRASLADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_MEDICO_TRASLADO" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);


--
-- Name: TurnoMedico FK_MEDICO_TURNO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."TurnoMedico"
    ADD CONSTRAINT "FK_MEDICO_TURNO" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);


--
-- Name: FichaTraslado FK_ORIGEN_TRASLADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_ORIGEN_TRASLADO" FOREIGN KEY (unidad_origen, hospital_origen) REFERENCES public."UnidadHospital"(tipo_unidad, id_hospital);


--
-- Name: FichaCita FK_PACIENTE_CITA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_PACIENTE_CITA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente) NOT VALID;


--
-- Name: ProcedimientoDiagnostico FK_PACIENTE_DIAGNOSTICO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcedimientoDiagnostico"
    ADD CONSTRAINT "FK_PACIENTE_DIAGNOSTICO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);


--
-- Name: PacienteEmergencia FK_PACIENTE_EMERGENCIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "FK_PACIENTE_EMERGENCIA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente);


--
-- Name: Encargado FK_PACIENTE_ENCARGADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "FK_PACIENTE_ENCARGADO" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente) NOT VALID;


--
-- Name: FichaIngreso FK_PACIENTE_FICHA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_PACIENTE_FICHA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente);


--
-- Name: Patologia FK_PACIENTE_PATOLOGIA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Patologia"
    ADD CONSTRAINT "FK_PACIENTE_PATOLOGIA" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);


--
-- Name: ProcesoQuirurgico FK_PACIENTE_PROCESO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcesoQuirurgico"
    ADD CONSTRAINT "FK_PACIENTE_PROCESO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);


--
-- Name: ServicioEmergencia FK_PACIENTE_SERVICIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "FK_PACIENTE_SERVICIO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);


--
-- Name: ProcesoTerapeutico FK_PACIENTE_TERAPEUTICO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ProcesoTerapeutico"
    ADD CONSTRAINT "FK_PACIENTE_TERAPEUTICO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);


--
-- Name: Ayudante FK_PERSONAL_AYUDANTE; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Ayudante"
    ADD CONSTRAINT "FK_PERSONAL_AYUDANTE" FOREIGN KEY (dpi) REFERENCES public."Personal"(persona) NOT VALID;


--
-- Name: MedicoConsulta FK_PERSONAL_CONSULTA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "FK_PERSONAL_CONSULTA" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);


--
-- Name: Paciente FK_PERSONA_PACIENTE; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "FK_PERSONA_PACIENTE" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi);


--
-- Name: Personal FK_PERSONA_PERSONAL; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_PERSONA_PERSONAL" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi);


--
-- Name: Encargado FK_PERSOSNA_ENCARGADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "FK_PERSOSNA_ENCARGADO" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi) NOT VALID;


--
-- Name: ChequeoPreanestesico FK_PREOPERATORIO_CHEQUEO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_PREOPERATORIO_CHEQUEO" FOREIGN KEY (preoperatorio) REFERENCES public."Preoperatoria"(cirugia);


--
-- Name: Consulta FK_PROXIMA_CONSULTA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_PROXIMA_CONSULTA" FOREIGN KEY (proxima_cita) REFERENCES public."FichaCita"(id);


--
-- Name: FichaCita FK_REPROGRAMADO_CITA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_REPROGRAMADO_CITA" FOREIGN KEY (reprogramada) REFERENCES public."FichaCita"(id) NOT VALID;


--
-- Name: ServicioEmergencia FK_SERVICIO_SERVICIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "FK_SERVICIO_SERVICIO" FOREIGN KEY (servicio) REFERENCES public."Servicio"(id);


--
-- Name: ServicioObtenido FK_SERVICIO_SERVICIO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "FK_SERVICIO_SERVICIO" FOREIGN KEY (servicio_hospitalizacion) REFERENCES public."ServicioHospitalizacion"(id);


--
-- Name: FichaTraslado FK_SIGUIENTE_TRASLADO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_SIGUIENTE_TRASLADO" FOREIGN KEY (ficha_ingreso_siguiente) REFERENCES public."FichaIngreso"(id) NOT VALID;


--
-- Name: EquipoQuirurgico FK_TIPO_EQUIPO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_TIPO_EQUIPO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);


--
-- Name: Instrumento FK_TIPO_INSTRUMENTO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_TIPO_INSTRUMENTO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);


--
-- Name: Insumo FK_TIPO_INSUMO; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "FK_TIPO_INSUMO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);


--
-- Name: Personal FK_TIPO_PERSONAL; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_TIPO_PERSONAL" FOREIGN KEY (tipo) REFERENCES public."TipoPersonal"(id);


--
-- Name: Postoperatorio FK_TRASLADO_POST; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "FK_TRASLADO_POST" FOREIGN KEY (ficha_traslado) REFERENCES public."FichaTraslado"(ingreso);


--
-- Name: FichaIngreso FK_UNIDAD_FICHA; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_UNIDAD_FICHA" FOREIGN KEY (unidad_medica) REFERENCES public."TipoUnidad"(id);


--
-- Name: UnidadHospital FK_UNIDAD_HOSPITAL; Type: FK CONSTRAINT; Schema: public; Owner: marito
--

ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "FK_UNIDAD_HOSPITAL" FOREIGN KEY (tipo_unidad) REFERENCES public."TipoUnidad"(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

