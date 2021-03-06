PGDMP         0                y            Hospital #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1) #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16489    Hospital    DATABASE     |   CREATE DATABASE "Hospital" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_GT.UTF-8' LC_CTYPE = 'es_GT.UTF-8';
    DROP DATABASE "Hospital";
                marito    false                        3079    16920 
   plpython3u 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS plpython3u WITH SCHEMA pg_catalog;
    DROP EXTENSION plpython3u;
                   false            ?           0    0    EXTENSION plpython3u    COMMENT     P   COMMENT ON EXTENSION plpython3u IS 'PL/Python3U untrusted procedural language';
                        false    1                       1259    17607    AgendamientoQuirurgico    TABLE     ?  CREATE TABLE public."AgendamientoQuirurgico" (
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
 ,   DROP TABLE public."AgendamientoQuirurgico";
       public         heap    marito    false            ?            1259    17420    AntecedenteHeredofamiliar    TABLE     ?   CREATE TABLE public."AntecedenteHeredofamiliar" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 /   DROP TABLE public."AntecedenteHeredofamiliar";
       public         heap    marito    false            ?            1259    17430    AntecedenteNoPatologico    TABLE     ?   CREATE TABLE public."AntecedenteNoPatologico" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 -   DROP TABLE public."AntecedenteNoPatologico";
       public         heap    marito    false            ?            1259    17440    AntecedentePatologico    TABLE     ?   CREATE TABLE public."AntecedentePatologico" (
    antecedente character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 +   DROP TABLE public."AntecedentePatologico";
       public         heap    marito    false            ?            1259    17311    AsignacionAyudante    TABLE     j   CREATE TABLE public."AsignacionAyudante" (
    ayudante integer NOT NULL,
    cirugia integer NOT NULL
);
 (   DROP TABLE public."AsignacionAyudante";
       public         heap    marito    false            ?            1259    17296    AsignacionMedicoCirugia    TABLE     ?   CREATE TABLE public."AsignacionMedicoCirugia" (
    medico integer NOT NULL,
    cirugia integer NOT NULL,
    tipo_cirugia integer NOT NULL
);
 -   DROP TABLE public."AsignacionMedicoCirugia";
       public         heap    marito    false            ?            1259    16925    Ayudante    TABLE     f   CREATE TABLE public."Ayudante" (
    dpi integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public."Ayudante";
       public         heap    marito    false            ?            1259    16928    CalificacionHospital    TABLE     ?   CREATE TABLE public."CalificacionHospital" (
    no_calificacion integer NOT NULL,
    hospital integer NOT NULL,
    calificacion smallint NOT NULL
);
 *   DROP TABLE public."CalificacionHospital";
       public         heap    marito    false            ?            1259    16931 (   CalificacionHospital_no_calificacion_seq    SEQUENCE     ?   CREATE SEQUENCE public."CalificacionHospital_no_calificacion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public."CalificacionHospital_no_calificacion_seq";
       public          marito    false    204            ?           0    0 (   CalificacionHospital_no_calificacion_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."CalificacionHospital_no_calificacion_seq" OWNED BY public."CalificacionHospital".no_calificacion;
          public          marito    false    205                       1259    17798    ChequeoPreanestesico    TABLE     2  CREATE TABLE public."ChequeoPreanestesico" (
    preoperatorio integer NOT NULL,
    clasificacion_riesgo character varying(30) NOT NULL,
    medico_clasificador integer NOT NULL,
    firma_medico character varying(25) NOT NULL,
    plan_anestecia text NOT NULL,
    medico_anestesista integer NOT NULL
);
 *   DROP TABLE public."ChequeoPreanestesico";
       public         heap    marito    false            ?            1259    16933    Cirugia    TABLE       CREATE TABLE public."Cirugia" (
    id integer NOT NULL,
    ficha_ingreso integer NOT NULL,
    tipo integer NOT NULL,
    precio money NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    "año" integer NOT NULL,
    hora smallint NOT NULL
);
    DROP TABLE public."Cirugia";
       public         heap    marito    false            ?            1259    16936    Cirugia_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Cirugia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Cirugia_id_seq";
       public          marito    false    206            ?           0    0    Cirugia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Cirugia_id_seq" OWNED BY public."Cirugia".id;
          public          marito    false    207            ?            1259    16938    Clinica    TABLE     f   CREATE TABLE public."Clinica" (
    numero_clinica integer NOT NULL,
    hospital integer NOT NULL
);
    DROP TABLE public."Clinica";
       public         heap    marito    false            ?            1259    16941    Clinica_numero_clinica_seq    SEQUENCE     ?   CREATE SEQUENCE public."Clinica_numero_clinica_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Clinica_numero_clinica_seq";
       public          marito    false    208            ?           0    0    Clinica_numero_clinica_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Clinica_numero_clinica_seq" OWNED BY public."Clinica".numero_clinica;
          public          marito    false    209            ?            1259    16943    CodigoEgreso    TABLE     i   CREATE TABLE public."CodigoEgreso" (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL
);
 "   DROP TABLE public."CodigoEgreso";
       public         heap    marito    false            ?            1259    16946    CodigoEgreso_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."CodigoEgreso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."CodigoEgreso_id_seq";
       public          marito    false    210            ?           0    0    CodigoEgreso_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."CodigoEgreso_id_seq" OWNED BY public."CodigoEgreso".id;
          public          marito    false    211            ?            1259    16948    Consulta    TABLE     3  CREATE TABLE public."Consulta" (
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
    DROP TABLE public."Consulta";
       public         heap    marito    false            ?            1259    16954    DiagnosticoSecundario    TABLE     ~   CREATE TABLE public."DiagnosticoSecundario" (
    egreso integer NOT NULL,
    diagnostico character varying(100) NOT NULL
);
 +   DROP TABLE public."DiagnosticoSecundario";
       public         heap    marito    false            ?            1259    16957 	   Encargado    TABLE     ?   CREATE TABLE public."Encargado" (
    persona integer NOT NULL,
    paciente integer NOT NULL,
    parentesco character varying(15) NOT NULL
);
    DROP TABLE public."Encargado";
       public         heap    marito    false            	           1259    17643    EquipoQuirurgico    TABLE     ?   CREATE TABLE public."EquipoQuirurgico" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    tipo integer NOT NULL,
    funcion integer NOT NULL
);
 &   DROP TABLE public."EquipoQuirurgico";
       public         heap    marito    false            ?            1259    16960    EspecialidadCirugia    TABLE     r   CREATE TABLE public."EspecialidadCirugia" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 )   DROP TABLE public."EspecialidadCirugia";
       public         heap    marito    false            ?            1259    16963    EspecialidadCirugia_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."EspecialidadCirugia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."EspecialidadCirugia_id_seq";
       public          marito    false    215            ?           0    0    EspecialidadCirugia_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."EspecialidadCirugia_id_seq" OWNED BY public."EspecialidadCirugia".id;
          public          marito    false    216            ?            1259    16965    EspecialidadConsulta    TABLE     s   CREATE TABLE public."EspecialidadConsulta" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 *   DROP TABLE public."EspecialidadConsulta";
       public         heap    marito    false            ?            1259    16971    EspecialidadConsulta_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."EspecialidadConsulta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."EspecialidadConsulta_id_seq";
       public          marito    false    217            ?           0    0    EspecialidadConsulta_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."EspecialidadConsulta_id_seq" OWNED BY public."EspecialidadConsulta".id;
          public          marito    false    218            ?            1259    17470    EstudioPrevio    TABLE     y   CREATE TABLE public."EstudioPrevio" (
    estudio character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 #   DROP TABLE public."EstudioPrevio";
       public         heap    marito    false                       1259    17510    ExploracionAbdomen    TABLE     ?   CREATE TABLE public."ExploracionAbdomen" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);
 (   DROP TABLE public."ExploracionAbdomen";
       public         heap    marito    false            ?            1259    17480    ExploracionCabeza    TABLE     ?   CREATE TABLE public."ExploracionCabeza" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);
 '   DROP TABLE public."ExploracionCabeza";
       public         heap    marito    false                       1259    17540    ExploracionCavidad    TABLE     ?   CREATE TABLE public."ExploracionCavidad" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL,
    cavidad character varying(20) NOT NULL
);
 (   DROP TABLE public."ExploracionCavidad";
       public         heap    marito    false                       1259    17530    ExploracionColumna    TABLE     ?   CREATE TABLE public."ExploracionColumna" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);
 (   DROP TABLE public."ExploracionColumna";
       public         heap    marito    false            ?            1259    17490    ExploracionCuello    TABLE     ?   CREATE TABLE public."ExploracionCuello" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);
 '   DROP TABLE public."ExploracionCuello";
       public         heap    marito    false                       1259    17520    ExploracionExtremidad    TABLE     ?   CREATE TABLE public."ExploracionExtremidad" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL,
    extremidad character(25) NOT NULL
);
 +   DROP TABLE public."ExploracionExtremidad";
       public         heap    marito    false                        1259    17500    ExploracionTorax    TABLE     ?   CREATE TABLE public."ExploracionTorax" (
    dato_encontrado character varying(50) NOT NULL,
    exploracion_fisica integer NOT NULL
);
 &   DROP TABLE public."ExploracionTorax";
       public         heap    marito    false            ?            1259    16973 	   FichaCita    TABLE     a  CREATE TABLE public."FichaCita" (
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
    DROP TABLE public."FichaCita";
       public         heap    marito    false            ?            1259    16979    FichaCita_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."FichaCita_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."FichaCita_id_seq";
       public          marito    false    219            ?           0    0    FichaCita_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."FichaCita_id_seq" OWNED BY public."FichaCita".id;
          public          marito    false    220            ?            1259    16981    FichaEgreso    TABLE       CREATE TABLE public."FichaEgreso" (
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
 !   DROP TABLE public."FichaEgreso";
       public         heap    marito    false            ?            1259    16984    FichaIngreso    TABLE     ?  CREATE TABLE public."FichaIngreso" (
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
 "   DROP TABLE public."FichaIngreso";
       public         heap    marito    false            ?            1259    16990    FichaIngreso_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."FichaIngreso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."FichaIngreso_id_seq";
       public          marito    false    222            ?           0    0    FichaIngreso_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."FichaIngreso_id_seq" OWNED BY public."FichaIngreso".id;
          public          marito    false    223            ?            1259    16992    FichaTraslado    TABLE     ?  CREATE TABLE public."FichaTraslado" (
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
 #   DROP TABLE public."FichaTraslado";
       public         heap    marito    false            
           1259    17661    FuncionEquipo    TABLE     l   CREATE TABLE public."FuncionEquipo" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 #   DROP TABLE public."FuncionEquipo";
       public         heap    marito    false                       1259    17671    FuncionInstrumento    TABLE     q   CREATE TABLE public."FuncionInstrumento" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 (   DROP TABLE public."FuncionInstrumento";
       public         heap    marito    false            ?            1259    16995    Hospital    TABLE     ?   CREATE TABLE public."Hospital" (
    id integer NOT NULL,
    informacion_especifica text NOT NULL,
    telefono character(8)[] NOT NULL,
    direccion character varying(30) NOT NULL
);
    DROP TABLE public."Hospital";
       public         heap    marito    false            ?            1259    17001    Hospital_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Hospital_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Hospital_id_seq";
       public          marito    false    225            ?           0    0    Hospital_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Hospital_id_seq" OWNED BY public."Hospital".id;
          public          marito    false    226                       1259    17823    HospitalizacionPaciente    TABLE     ?   CREATE TABLE public."HospitalizacionPaciente" (
    id integer NOT NULL,
    ficha_ingreso integer NOT NULL,
    costo money NOT NULL,
    dias_internado integer NOT NULL,
    cancelado boolean NOT NULL,
    cuotas smallint NOT NULL
);
 -   DROP TABLE public."HospitalizacionPaciente";
       public         heap    marito    false                       1259    17821    HospitalizacionPaciente_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."HospitalizacionPaciente_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."HospitalizacionPaciente_id_seq";
       public          marito    false    281            ?           0    0    HospitalizacionPaciente_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."HospitalizacionPaciente_id_seq" OWNED BY public."HospitalizacionPaciente".id;
          public          marito    false    280                       1259    17676    Instrumento    TABLE     ?   CREATE TABLE public."Instrumento" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    tipo integer NOT NULL,
    funcion integer NOT NULL
);
 !   DROP TABLE public."Instrumento";
       public         heap    marito    false                       1259    17625    Insumo    TABLE     ?   CREATE TABLE public."Insumo" (
    agendamiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    material character varying(50) NOT NULL,
    tipo integer NOT NULL
);
    DROP TABLE public."Insumo";
       public         heap    marito    false                       1259    17834    InsumoHospitalizacion    TABLE     ?   CREATE TABLE public."InsumoHospitalizacion" (
    hospitalizacion_paciente integer NOT NULL,
    descripcion character varying(200) NOT NULL,
    precio money NOT NULL
);
 +   DROP TABLE public."InsumoHospitalizacion";
       public         heap    marito    false            ?            1259    17334    Intraoperatorio    TABLE     -  CREATE TABLE public."Intraoperatorio" (
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
 %   DROP TABLE public."Intraoperatorio";
       public         heap    marito    false            ?            1259    17003    Medicamento    TABLE     ?   CREATE TABLE public."Medicamento" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    precio money NOT NULL
);
 !   DROP TABLE public."Medicamento";
       public         heap    marito    false            ?            1259    17006    Medicamento_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Medicamento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Medicamento_id_seq";
       public          marito    false    227            ?           0    0    Medicamento_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Medicamento_id_seq" OWNED BY public."Medicamento".id;
          public          marito    false    228            ?            1259    17281    MedicoCirugia    TABLE     h   CREATE TABLE public."MedicoCirugia" (
    medico integer NOT NULL,
    especialidad integer NOT NULL
);
 #   DROP TABLE public."MedicoCirugia";
       public         heap    marito    false            ?            1259    17008    MedicoConsulta    TABLE     i   CREATE TABLE public."MedicoConsulta" (
    medico integer NOT NULL,
    especialidad integer NOT NULL
);
 $   DROP TABLE public."MedicoConsulta";
       public         heap    marito    false            ?            1259    17011    Paciente    TABLE     e   CREATE TABLE public."Paciente" (
    no_expediente integer NOT NULL,
    persona integer NOT NULL
);
    DROP TABLE public."Paciente";
       public         heap    marito    false                       1259    17701    PacienteEmergencia    TABLE     S  CREATE TABLE public."PacienteEmergencia" (
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
 (   DROP TABLE public."PacienteEmergencia";
       public         heap    marito    false                       1259    17699    PacienteEmergencia_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."PacienteEmergencia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."PacienteEmergencia_id_seq";
       public          marito    false    270            ?           0    0    PacienteEmergencia_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."PacienteEmergencia_id_seq" OWNED BY public."PacienteEmergencia".id;
          public          marito    false    269            ?            1259    17014    Paciente_no_expediente_seq    SEQUENCE     ?   CREATE SEQUENCE public."Paciente_no_expediente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Paciente_no_expediente_seq";
       public          marito    false    230            ?           0    0    Paciente_no_expediente_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Paciente_no_expediente_seq" OWNED BY public."Paciente".no_expediente;
          public          marito    false    231                       1259    17740 	   Patologia    TABLE        CREATE TABLE public."Patologia" (
    paciente_emergencia integer NOT NULL,
    informacion character varying(100) NOT NULL
);
    DROP TABLE public."Patologia";
       public         heap    marito    false            ?            1259    17016    PersonaRegistrada    TABLE     ?  CREATE TABLE public."PersonaRegistrada" (
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
 '   DROP TABLE public."PersonaRegistrada";
       public         heap    marito    false            ?            1259    17019    Personal    TABLE     {   CREATE TABLE public."Personal" (
    persona integer NOT NULL,
    tipo integer NOT NULL,
    hospital integer NOT NULL
);
    DROP TABLE public."Personal";
       public         heap    marito    false            ?            1259    17392    Postoperatorio    TABLE     ?  CREATE TABLE public."Postoperatorio" (
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
 $   DROP TABLE public."Postoperatorio";
       public         heap    marito    false            ?            1259    17407    Preoperatoria    TABLE     ?  CREATE TABLE public."Preoperatoria" (
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
 #   DROP TABLE public."Preoperatoria";
       public         heap    marito    false                       1259    17783    Prescripcion    TABLE     ?   CREATE TABLE public."Prescripcion" (
    consulta integer NOT NULL,
    medicamento integer NOT NULL,
    dosis character varying(200) NOT NULL,
    duracion character varying(50) NOT NULL,
    cantidad_total integer NOT NULL
);
 "   DROP TABLE public."Prescripcion";
       public         heap    marito    false                       1259    17550    Procedimiento    TABLE     |  CREATE TABLE public."Procedimiento" (
    chequeo_consentimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    caracteristicas character varying(200)[] NOT NULL,
    riesgos character varying(150)[] NOT NULL,
    objetivo character varying(150) NOT NULL,
    persona_autorizacion integer,
    medico integer NOT NULL,
    tipo_procedimiento integer NOT NULL
);
 #   DROP TABLE public."Procedimiento";
       public         heap    marito    false                       1259    17727    ProcedimientoDiagnostico    TABLE     ?   CREATE TABLE public."ProcedimientoDiagnostico" (
    diagnostico character varying(150) NOT NULL,
    paciente_emergencia integer NOT NULL,
    procedimiento text NOT NULL
);
 .   DROP TABLE public."ProcedimientoDiagnostico";
       public         heap    marito    false                       1259    17717    ProcesoQuirurgico    TABLE     ?   CREATE TABLE public."ProcesoQuirurgico" (
    paciente_emergencia integer NOT NULL,
    proceso_quirurgico character varying(50) NOT NULL
);
 '   DROP TABLE public."ProcesoQuirurgico";
       public         heap    marito    false                       1259    17750    ProcesoTerapeutico    TABLE     ?   CREATE TABLE public."ProcesoTerapeutico" (
    paciente_emergencia integer NOT NULL,
    proceso_terapeutico character varying(100) NOT NULL
);
 (   DROP TABLE public."ProcesoTerapeutico";
       public         heap    marito    false                       1259    17762    Servicio    TABLE     g   CREATE TABLE public."Servicio" (
    id integer NOT NULL,
    nombre character varying(70) NOT NULL
);
    DROP TABLE public."Servicio";
       public         heap    marito    false                       1259    17768    ServicioEmergencia    TABLE     v   CREATE TABLE public."ServicioEmergencia" (
    servicio integer NOT NULL,
    paciente_emergencia integer NOT NULL
);
 (   DROP TABLE public."ServicioEmergencia";
       public         heap    marito    false                       1259    17846    ServicioHospitalizacion    TABLE     ?   CREATE TABLE public."ServicioHospitalizacion" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    costo_dia money NOT NULL
);
 -   DROP TABLE public."ServicioHospitalizacion";
       public         heap    marito    false                       1259    17844    ServicioHospitalizacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ServicioHospitalizacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."ServicioHospitalizacion_id_seq";
       public          marito    false    284            ?           0    0    ServicioHospitalizacion_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ServicioHospitalizacion_id_seq" OWNED BY public."ServicioHospitalizacion".id;
          public          marito    false    283                       1259    17852    ServicioObtenido    TABLE     ?   CREATE TABLE public."ServicioObtenido" (
    hospitalizacion_paciente integer NOT NULL,
    servicio_hospitalizacion integer NOT NULL
);
 &   DROP TABLE public."ServicioObtenido";
       public         heap    marito    false                       1259    17760    Servicio_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Servicio_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Servicio_id_seq";
       public          marito    false    276            ?           0    0    Servicio_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Servicio_id_seq" OWNED BY public."Servicio".id;
          public          marito    false    275            ?            1259    17460    SintomaAparato    TABLE     z   CREATE TABLE public."SintomaAparato" (
    sintoma character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 $   DROP TABLE public."SintomaAparato";
       public         heap    marito    false            ?            1259    17450    SintomaGeneral    TABLE     z   CREATE TABLE public."SintomaGeneral" (
    sintoma character varying(50) NOT NULL,
    interrogatorio integer NOT NULL
);
 $   DROP TABLE public."SintomaGeneral";
       public         heap    marito    false            ?            1259    17328    TipoCondicion    TABLE     o   CREATE TABLE public."TipoCondicion" (
    id integer NOT NULL,
    condicion character varying(50) NOT NULL
);
 #   DROP TABLE public."TipoCondicion";
       public         heap    marito    false            ?            1259    17326    TipoCondicion_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."TipoCondicion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."TipoCondicion_id_seq";
       public          marito    false    244            ?           0    0    TipoCondicion_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."TipoCondicion_id_seq" OWNED BY public."TipoCondicion".id;
          public          marito    false    243                       1259    17620 
   TipoObjeto    TABLE     i   CREATE TABLE public."TipoObjeto" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
     DROP TABLE public."TipoObjeto";
       public         heap    marito    false            ?            1259    17022    TipoPersonal    TABLE     k   CREATE TABLE public."TipoPersonal" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);
 "   DROP TABLE public."TipoPersonal";
       public         heap    marito    false            ?            1259    17025    TipoPersonal_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."TipoPersonal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."TipoPersonal_id_seq";
       public          marito    false    234            ?           0    0    TipoPersonal_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."TipoPersonal_id_seq" OWNED BY public."TipoPersonal".id;
          public          marito    false    235            ?            1259    17027 
   TipoUnidad    TABLE     i   CREATE TABLE public."TipoUnidad" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);
     DROP TABLE public."TipoUnidad";
       public         heap    marito    false            ?            1259    17033    TipoUnidad_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."TipoUnidad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."TipoUnidad_id_seq";
       public          marito    false    236            ?           0    0    TipoUnidad_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."TipoUnidad_id_seq" OWNED BY public."TipoUnidad".id;
          public          marito    false    237            ?            1259    17035    TurnoMedico    TABLE     z   CREATE TABLE public."TurnoMedico" (
    medico integer NOT NULL,
    turno boolean NOT NULL,
    dia smallint NOT NULL
);
 !   DROP TABLE public."TurnoMedico";
       public         heap    marito    false            ?            1259    17038    UnidadHospital    TABLE     ?   CREATE TABLE public."UnidadHospital" (
    id_hospital integer NOT NULL,
    tipo_unidad integer NOT NULL,
    informacion text NOT NULL
);
 $   DROP TABLE public."UnidadHospital";
       public         heap    marito    false            l           2604    17044 $   CalificacionHospital no_calificacion    DEFAULT     ?   ALTER TABLE ONLY public."CalificacionHospital" ALTER COLUMN no_calificacion SET DEFAULT nextval('public."CalificacionHospital_no_calificacion_seq"'::regclass);
 U   ALTER TABLE public."CalificacionHospital" ALTER COLUMN no_calificacion DROP DEFAULT;
       public          marito    false    205    204            m           2604    17045 
   Cirugia id    DEFAULT     l   ALTER TABLE ONLY public."Cirugia" ALTER COLUMN id SET DEFAULT nextval('public."Cirugia_id_seq"'::regclass);
 ;   ALTER TABLE public."Cirugia" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    207    206            n           2604    17046    Clinica numero_clinica    DEFAULT     ?   ALTER TABLE ONLY public."Clinica" ALTER COLUMN numero_clinica SET DEFAULT nextval('public."Clinica_numero_clinica_seq"'::regclass);
 G   ALTER TABLE public."Clinica" ALTER COLUMN numero_clinica DROP DEFAULT;
       public          marito    false    209    208            o           2604    17047    CodigoEgreso id    DEFAULT     v   ALTER TABLE ONLY public."CodigoEgreso" ALTER COLUMN id SET DEFAULT nextval('public."CodigoEgreso_id_seq"'::regclass);
 @   ALTER TABLE public."CodigoEgreso" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    211    210            p           2604    17048    EspecialidadCirugia id    DEFAULT     ?   ALTER TABLE ONLY public."EspecialidadCirugia" ALTER COLUMN id SET DEFAULT nextval('public."EspecialidadCirugia_id_seq"'::regclass);
 G   ALTER TABLE public."EspecialidadCirugia" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    216    215            q           2604    17049    EspecialidadConsulta id    DEFAULT     ?   ALTER TABLE ONLY public."EspecialidadConsulta" ALTER COLUMN id SET DEFAULT nextval('public."EspecialidadConsulta_id_seq"'::regclass);
 H   ALTER TABLE public."EspecialidadConsulta" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    218    217            r           2604    17050    FichaCita id    DEFAULT     p   ALTER TABLE ONLY public."FichaCita" ALTER COLUMN id SET DEFAULT nextval('public."FichaCita_id_seq"'::regclass);
 =   ALTER TABLE public."FichaCita" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    220    219            s           2604    17051    FichaIngreso id    DEFAULT     v   ALTER TABLE ONLY public."FichaIngreso" ALTER COLUMN id SET DEFAULT nextval('public."FichaIngreso_id_seq"'::regclass);
 @   ALTER TABLE public."FichaIngreso" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    223    222            t           2604    17052    Hospital id    DEFAULT     n   ALTER TABLE ONLY public."Hospital" ALTER COLUMN id SET DEFAULT nextval('public."Hospital_id_seq"'::regclass);
 <   ALTER TABLE public."Hospital" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    226    225            |           2604    17826    HospitalizacionPaciente id    DEFAULT     ?   ALTER TABLE ONLY public."HospitalizacionPaciente" ALTER COLUMN id SET DEFAULT nextval('public."HospitalizacionPaciente_id_seq"'::regclass);
 K   ALTER TABLE public."HospitalizacionPaciente" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    281    280    281            u           2604    17053    Medicamento id    DEFAULT     t   ALTER TABLE ONLY public."Medicamento" ALTER COLUMN id SET DEFAULT nextval('public."Medicamento_id_seq"'::regclass);
 ?   ALTER TABLE public."Medicamento" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    228    227            v           2604    17054    Paciente no_expediente    DEFAULT     ?   ALTER TABLE ONLY public."Paciente" ALTER COLUMN no_expediente SET DEFAULT nextval('public."Paciente_no_expediente_seq"'::regclass);
 G   ALTER TABLE public."Paciente" ALTER COLUMN no_expediente DROP DEFAULT;
       public          marito    false    231    230            z           2604    17704    PacienteEmergencia id    DEFAULT     ?   ALTER TABLE ONLY public."PacienteEmergencia" ALTER COLUMN id SET DEFAULT nextval('public."PacienteEmergencia_id_seq"'::regclass);
 F   ALTER TABLE public."PacienteEmergencia" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    269    270    270            {           2604    17765    Servicio id    DEFAULT     n   ALTER TABLE ONLY public."Servicio" ALTER COLUMN id SET DEFAULT nextval('public."Servicio_id_seq"'::regclass);
 <   ALTER TABLE public."Servicio" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    276    275    276            }           2604    17849    ServicioHospitalizacion id    DEFAULT     ?   ALTER TABLE ONLY public."ServicioHospitalizacion" ALTER COLUMN id SET DEFAULT nextval('public."ServicioHospitalizacion_id_seq"'::regclass);
 K   ALTER TABLE public."ServicioHospitalizacion" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    284    283    284            y           2604    17331    TipoCondicion id    DEFAULT     x   ALTER TABLE ONLY public."TipoCondicion" ALTER COLUMN id SET DEFAULT nextval('public."TipoCondicion_id_seq"'::regclass);
 A   ALTER TABLE public."TipoCondicion" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    243    244    244            w           2604    17055    TipoPersonal id    DEFAULT     v   ALTER TABLE ONLY public."TipoPersonal" ALTER COLUMN id SET DEFAULT nextval('public."TipoPersonal_id_seq"'::regclass);
 @   ALTER TABLE public."TipoPersonal" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    235    234            x           2604    17056    TipoUnidad id    DEFAULT     r   ALTER TABLE ONLY public."TipoUnidad" ALTER COLUMN id SET DEFAULT nextval('public."TipoUnidad_id_seq"'::regclass);
 >   ALTER TABLE public."TipoUnidad" ALTER COLUMN id DROP DEFAULT;
       public          marito    false    237    236            ?           2606    17614 2   AgendamientoQuirurgico AgendamientoQuirurgico_pkey 
   CONSTRAINT        ALTER TABLE ONLY public."AgendamientoQuirurgico"
    ADD CONSTRAINT "AgendamientoQuirurgico_pkey" PRIMARY KEY (preoperatoria);
 `   ALTER TABLE ONLY public."AgendamientoQuirurgico" DROP CONSTRAINT "AgendamientoQuirurgico_pkey";
       public            marito    false    262            ?           2606    17424 8   AntecedenteHeredofamiliar AntecedenteHeredofamiliar_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedenteHeredofamiliar"
    ADD CONSTRAINT "AntecedenteHeredofamiliar_pkey" PRIMARY KEY (antecedente, interrogatorio);
 f   ALTER TABLE ONLY public."AntecedenteHeredofamiliar" DROP CONSTRAINT "AntecedenteHeredofamiliar_pkey";
       public            marito    false    248    248            ?           2606    17434 4   AntecedenteNoPatologico AntecedenteNoPatologico_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedenteNoPatologico"
    ADD CONSTRAINT "AntecedenteNoPatologico_pkey" PRIMARY KEY (antecedente, interrogatorio);
 b   ALTER TABLE ONLY public."AntecedenteNoPatologico" DROP CONSTRAINT "AntecedenteNoPatologico_pkey";
       public            marito    false    249    249            ?           2606    17444 0   AntecedentePatologico AntecedentePatologico_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedentePatologico"
    ADD CONSTRAINT "AntecedentePatologico_pkey" PRIMARY KEY (antecedente, interrogatorio);
 ^   ALTER TABLE ONLY public."AntecedentePatologico" DROP CONSTRAINT "AntecedentePatologico_pkey";
       public            marito    false    250    250            ?           2606    17315 *   AsignacionAyudante AsignacionAyudante_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "AsignacionAyudante_pkey" PRIMARY KEY (ayudante, cirugia);
 X   ALTER TABLE ONLY public."AsignacionAyudante" DROP CONSTRAINT "AsignacionAyudante_pkey";
       public            marito    false    242    242            ?           2606    17300 4   AsignacionMedicoCirugia AsignacionMedicoCirugia_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "AsignacionMedicoCirugia_pkey" PRIMARY KEY (medico, cirugia);
 b   ALTER TABLE ONLY public."AsignacionMedicoCirugia" DROP CONSTRAINT "AsignacionMedicoCirugia_pkey";
       public            marito    false    241    241                       2606    17058    Ayudante Ayudante_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Ayudante"
    ADD CONSTRAINT "Ayudante_pkey" PRIMARY KEY (dpi);
 D   ALTER TABLE ONLY public."Ayudante" DROP CONSTRAINT "Ayudante_pkey";
       public            marito    false    203            ?           2606    17060 .   CalificacionHospital CalificacionHospital_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."CalificacionHospital"
    ADD CONSTRAINT "CalificacionHospital_pkey" PRIMARY KEY (no_calificacion);
 \   ALTER TABLE ONLY public."CalificacionHospital" DROP CONSTRAINT "CalificacionHospital_pkey";
       public            marito    false    204            ?           2606    17805 .   ChequeoPreanestesico ChequeoPreanestesico_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "ChequeoPreanestesico_pkey" PRIMARY KEY (preoperatorio);
 \   ALTER TABLE ONLY public."ChequeoPreanestesico" DROP CONSTRAINT "ChequeoPreanestesico_pkey";
       public            marito    false    279            ?           2606    17062    Cirugia Cirugia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "Cirugia_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Cirugia" DROP CONSTRAINT "Cirugia_pkey";
       public            marito    false    206            ?           2606    17064    Clinica Clinica_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Clinica"
    ADD CONSTRAINT "Clinica_pkey" PRIMARY KEY (numero_clinica);
 B   ALTER TABLE ONLY public."Clinica" DROP CONSTRAINT "Clinica_pkey";
       public            marito    false    208            ?           2606    17066    CodigoEgreso CodigoEgreso_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."CodigoEgreso"
    ADD CONSTRAINT "CodigoEgreso_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."CodigoEgreso" DROP CONSTRAINT "CodigoEgreso_pkey";
       public            marito    false    210            ?           2606    17068    Consulta Consulta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "Consulta_pkey" PRIMARY KEY (cita);
 D   ALTER TABLE ONLY public."Consulta" DROP CONSTRAINT "Consulta_pkey";
       public            marito    false    212            ?           2606    17070 0   DiagnosticoSecundario DiagnosticoSecundario_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."DiagnosticoSecundario"
    ADD CONSTRAINT "DiagnosticoSecundario_pkey" PRIMARY KEY (egreso, diagnostico);
 ^   ALTER TABLE ONLY public."DiagnosticoSecundario" DROP CONSTRAINT "DiagnosticoSecundario_pkey";
       public            marito    false    213    213            ?           2606    17072    Encargado Encargado_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "Encargado_pkey" PRIMARY KEY (persona, paciente);
 F   ALTER TABLE ONLY public."Encargado" DROP CONSTRAINT "Encargado_pkey";
       public            marito    false    214    214            ?           2606    17650 &   EquipoQuirurgico EquipoQuirurgico_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "EquipoQuirurgico_pkey" PRIMARY KEY (nombre, agendamiento);
 T   ALTER TABLE ONLY public."EquipoQuirurgico" DROP CONSTRAINT "EquipoQuirurgico_pkey";
       public            marito    false    265    265            ?           2606    17074 ,   EspecialidadCirugia EspecialidadCirugia_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."EspecialidadCirugia"
    ADD CONSTRAINT "EspecialidadCirugia_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."EspecialidadCirugia" DROP CONSTRAINT "EspecialidadCirugia_pkey";
       public            marito    false    215            ?           2606    17076 .   EspecialidadConsulta EspecialidadConsulta_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."EspecialidadConsulta"
    ADD CONSTRAINT "EspecialidadConsulta_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."EspecialidadConsulta" DROP CONSTRAINT "EspecialidadConsulta_pkey";
       public            marito    false    217            ?           2606    17474     EstudioPrevio EstudioPrevio_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."EstudioPrevio"
    ADD CONSTRAINT "EstudioPrevio_pkey" PRIMARY KEY (estudio, interrogatorio);
 N   ALTER TABLE ONLY public."EstudioPrevio" DROP CONSTRAINT "EstudioPrevio_pkey";
       public            marito    false    253    253            ?           2606    17514 *   ExploracionAbdomen ExploracionAbdomen_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionAbdomen"
    ADD CONSTRAINT "ExploracionAbdomen_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 X   ALTER TABLE ONLY public."ExploracionAbdomen" DROP CONSTRAINT "ExploracionAbdomen_pkey";
       public            marito    false    257    257            ?           2606    17484 (   ExploracionCabeza ExploracionCabeza_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCabeza"
    ADD CONSTRAINT "ExploracionCabeza_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 V   ALTER TABLE ONLY public."ExploracionCabeza" DROP CONSTRAINT "ExploracionCabeza_pkey";
       public            marito    false    254    254            ?           2606    17544 *   ExploracionCavidad ExploracionCavidad_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCavidad"
    ADD CONSTRAINT "ExploracionCavidad_pkey" PRIMARY KEY (exploracion_fisica, dato_encontrado);
 X   ALTER TABLE ONLY public."ExploracionCavidad" DROP CONSTRAINT "ExploracionCavidad_pkey";
       public            marito    false    260    260            ?           2606    17534 *   ExploracionColumna ExploracionColumna_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionColumna"
    ADD CONSTRAINT "ExploracionColumna_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 X   ALTER TABLE ONLY public."ExploracionColumna" DROP CONSTRAINT "ExploracionColumna_pkey";
       public            marito    false    259    259            ?           2606    17494 (   ExploracionCuello ExploracionCuello_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCuello"
    ADD CONSTRAINT "ExploracionCuello_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 V   ALTER TABLE ONLY public."ExploracionCuello" DROP CONSTRAINT "ExploracionCuello_pkey";
       public            marito    false    255    255            ?           2606    17524 0   ExploracionExtremidad ExploracionExtremidad_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionExtremidad"
    ADD CONSTRAINT "ExploracionExtremidad_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 ^   ALTER TABLE ONLY public."ExploracionExtremidad" DROP CONSTRAINT "ExploracionExtremidad_pkey";
       public            marito    false    258    258            ?           2606    17504 &   ExploracionTorax ExploracionTorax_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionTorax"
    ADD CONSTRAINT "ExploracionTorax_pkey" PRIMARY KEY (dato_encontrado, exploracion_fisica);
 T   ALTER TABLE ONLY public."ExploracionTorax" DROP CONSTRAINT "ExploracionTorax_pkey";
       public            marito    false    256    256            ?           2606    17078    FichaCita FichaCita_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FichaCita_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."FichaCita" DROP CONSTRAINT "FichaCita_pkey";
       public            marito    false    219            ?           2606    17080    FichaEgreso FichaEgreso_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FichaEgreso_pkey" PRIMARY KEY (id_ficha);
 J   ALTER TABLE ONLY public."FichaEgreso" DROP CONSTRAINT "FichaEgreso_pkey";
       public            marito    false    221            ?           2606    17082    FichaIngreso FichaIngreso_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FichaIngreso_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FichaIngreso_pkey";
       public            marito    false    222            ?           2606    17084     FichaTraslado FichaTraslado_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FichaTraslado_pkey" PRIMARY KEY (ingreso);
 N   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FichaTraslado_pkey";
       public            marito    false    224            ?           2606    17665     FuncionEquipo FuncionEquipo_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."FuncionEquipo"
    ADD CONSTRAINT "FuncionEquipo_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."FuncionEquipo" DROP CONSTRAINT "FuncionEquipo_pkey";
       public            marito    false    266            ?           2606    17675 *   FuncionInstrumento FuncionInstrumento_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."FuncionInstrumento"
    ADD CONSTRAINT "FuncionInstrumento_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."FuncionInstrumento" DROP CONSTRAINT "FuncionInstrumento_pkey";
       public            marito    false    267            ?           2606    17086    Hospital Hospital_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_pkey";
       public            marito    false    225            ?           2606    17828 4   HospitalizacionPaciente HospitalizacionPaciente_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."HospitalizacionPaciente"
    ADD CONSTRAINT "HospitalizacionPaciente_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."HospitalizacionPaciente" DROP CONSTRAINT "HospitalizacionPaciente_pkey";
       public            marito    false    281            ?           2606    17683    Instrumento Instrumento_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "Instrumento_pkey" PRIMARY KEY (nombre, agendamiento);
 J   ALTER TABLE ONLY public."Instrumento" DROP CONSTRAINT "Instrumento_pkey";
       public            marito    false    268    268            ?           2606    17838 0   InsumoHospitalizacion InsumoHospitalizacion_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."InsumoHospitalizacion"
    ADD CONSTRAINT "InsumoHospitalizacion_pkey" PRIMARY KEY (descripcion, hospitalizacion_paciente);
 ^   ALTER TABLE ONLY public."InsumoHospitalizacion" DROP CONSTRAINT "InsumoHospitalizacion_pkey";
       public            marito    false    282    282            ?           2606    17632    Insumo Insumo_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "Insumo_pkey" PRIMARY KEY (nombre, agendamiento);
 @   ALTER TABLE ONLY public."Insumo" DROP CONSTRAINT "Insumo_pkey";
       public            marito    false    264    264            ?           2606    17341 $   Intraoperatorio Intraoperatorio_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "Intraoperatorio_pkey" PRIMARY KEY (cirugia);
 R   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "Intraoperatorio_pkey";
       public            marito    false    245            ?           2606    17088    Medicamento Medicamento_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Medicamento"
    ADD CONSTRAINT "Medicamento_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Medicamento" DROP CONSTRAINT "Medicamento_pkey";
       public            marito    false    227            ?           2606    17285     MedicoCirugia MedicoCirugia_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "MedicoCirugia_pkey" PRIMARY KEY (medico, especialidad);
 N   ALTER TABLE ONLY public."MedicoCirugia" DROP CONSTRAINT "MedicoCirugia_pkey";
       public            marito    false    240    240            ?           2606    17090 "   MedicoConsulta MedicoConsulta_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "MedicoConsulta_pkey" PRIMARY KEY (medico);
 P   ALTER TABLE ONLY public."MedicoConsulta" DROP CONSTRAINT "MedicoConsulta_pkey";
       public            marito    false    229            ?           2606    17706 *   PacienteEmergencia PacienteEmergencia_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "PacienteEmergencia_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."PacienteEmergencia" DROP CONSTRAINT "PacienteEmergencia_pkey";
       public            marito    false    270            ?           2606    17092    Paciente Paciente_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (no_expediente);
 D   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_pkey";
       public            marito    false    230            ?           2606    17744    Patologia Patologia_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Patologia"
    ADD CONSTRAINT "Patologia_pkey" PRIMARY KEY (paciente_emergencia, informacion);
 F   ALTER TABLE ONLY public."Patologia" DROP CONSTRAINT "Patologia_pkey";
       public            marito    false    273    273            ?           2606    17094 (   PersonaRegistrada PersonaRegistrada_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."PersonaRegistrada"
    ADD CONSTRAINT "PersonaRegistrada_pkey" PRIMARY KEY (dpi);
 V   ALTER TABLE ONLY public."PersonaRegistrada" DROP CONSTRAINT "PersonaRegistrada_pkey";
       public            marito    false    232            ?           2606    17096    Personal Personal_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "Personal_pkey" PRIMARY KEY (persona);
 D   ALTER TABLE ONLY public."Personal" DROP CONSTRAINT "Personal_pkey";
       public            marito    false    233            ?           2606    17396 "   Postoperatorio Postoperatorio_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "Postoperatorio_pkey" PRIMARY KEY (cirugia);
 P   ALTER TABLE ONLY public."Postoperatorio" DROP CONSTRAINT "Postoperatorio_pkey";
       public            marito    false    246            ?           2606    17414     Preoperatoria Preoperatoria_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Preoperatoria"
    ADD CONSTRAINT "Preoperatoria_pkey" PRIMARY KEY (cirugia);
 N   ALTER TABLE ONLY public."Preoperatoria" DROP CONSTRAINT "Preoperatoria_pkey";
       public            marito    false    247            ?           2606    17787    Prescripcion Prescripcion_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "Prescripcion_pkey" PRIMARY KEY (consulta, medicamento);
 L   ALTER TABLE ONLY public."Prescripcion" DROP CONSTRAINT "Prescripcion_pkey";
       public            marito    false    278    278            ?           2606    17734 6   ProcedimientoDiagnostico ProcedimientoDiagnostico_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ProcedimientoDiagnostico"
    ADD CONSTRAINT "ProcedimientoDiagnostico_pkey" PRIMARY KEY (diagnostico, paciente_emergencia);
 d   ALTER TABLE ONLY public."ProcedimientoDiagnostico" DROP CONSTRAINT "ProcedimientoDiagnostico_pkey";
       public            marito    false    272    272            ?           2606    17557     Procedimiento Procedimiento_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "Procedimiento_pkey" PRIMARY KEY (nombre, chequeo_consentimiento);
 N   ALTER TABLE ONLY public."Procedimiento" DROP CONSTRAINT "Procedimiento_pkey";
       public            marito    false    261    261            ?           2606    17721 (   ProcesoQuirurgico ProcesoQuirurgico_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ProcesoQuirurgico"
    ADD CONSTRAINT "ProcesoQuirurgico_pkey" PRIMARY KEY (paciente_emergencia, proceso_quirurgico);
 V   ALTER TABLE ONLY public."ProcesoQuirurgico" DROP CONSTRAINT "ProcesoQuirurgico_pkey";
       public            marito    false    271    271            ?           2606    17754 *   ProcesoTerapeutico ProcesoTerapeutico_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ProcesoTerapeutico"
    ADD CONSTRAINT "ProcesoTerapeutico_pkey" PRIMARY KEY (paciente_emergencia, proceso_terapeutico);
 X   ALTER TABLE ONLY public."ProcesoTerapeutico" DROP CONSTRAINT "ProcesoTerapeutico_pkey";
       public            marito    false    274    274            ?           2606    17772 *   ServicioEmergencia ServicioEmergencia_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "ServicioEmergencia_pkey" PRIMARY KEY (servicio, paciente_emergencia);
 X   ALTER TABLE ONLY public."ServicioEmergencia" DROP CONSTRAINT "ServicioEmergencia_pkey";
       public            marito    false    277    277            ?           2606    17851 4   ServicioHospitalizacion ServicioHospitalizacion_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."ServicioHospitalizacion"
    ADD CONSTRAINT "ServicioHospitalizacion_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."ServicioHospitalizacion" DROP CONSTRAINT "ServicioHospitalizacion_pkey";
       public            marito    false    284            ?           2606    17856 &   ServicioObtenido ServicioObtenido_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "ServicioObtenido_pkey" PRIMARY KEY (hospitalizacion_paciente, servicio_hospitalizacion);
 T   ALTER TABLE ONLY public."ServicioObtenido" DROP CONSTRAINT "ServicioObtenido_pkey";
       public            marito    false    285    285            ?           2606    17767    Servicio Servicio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Servicio" DROP CONSTRAINT "Servicio_pkey";
       public            marito    false    276            ?           2606    17464 "   SintomaAparato SintomaAparato_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."SintomaAparato"
    ADD CONSTRAINT "SintomaAparato_pkey" PRIMARY KEY (interrogatorio, sintoma);
 P   ALTER TABLE ONLY public."SintomaAparato" DROP CONSTRAINT "SintomaAparato_pkey";
       public            marito    false    252    252            ?           2606    17454 "   SintomaGeneral SintomaGeneral_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."SintomaGeneral"
    ADD CONSTRAINT "SintomaGeneral_pkey" PRIMARY KEY (sintoma, interrogatorio);
 P   ALTER TABLE ONLY public."SintomaGeneral" DROP CONSTRAINT "SintomaGeneral_pkey";
       public            marito    false    251    251            ?           2606    17333     TipoCondicion TipoCondicion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."TipoCondicion"
    ADD CONSTRAINT "TipoCondicion_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."TipoCondicion" DROP CONSTRAINT "TipoCondicion_pkey";
       public            marito    false    244            ?           2606    17624    TipoObjeto TipoObjeto_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."TipoObjeto"
    ADD CONSTRAINT "TipoObjeto_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."TipoObjeto" DROP CONSTRAINT "TipoObjeto_pkey";
       public            marito    false    263            ?           2606    17098    TipoPersonal TipoPersonal_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."TipoPersonal"
    ADD CONSTRAINT "TipoPersonal_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."TipoPersonal" DROP CONSTRAINT "TipoPersonal_pkey";
       public            marito    false    234            ?           2606    17100    TipoUnidad TipoUnidad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."TipoUnidad"
    ADD CONSTRAINT "TipoUnidad_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."TipoUnidad" DROP CONSTRAINT "TipoUnidad_pkey";
       public            marito    false    236            ?           2606    17102    TurnoMedico TurnoMedico_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."TurnoMedico"
    ADD CONSTRAINT "TurnoMedico_pkey" PRIMARY KEY (medico, dia);
 J   ALTER TABLE ONLY public."TurnoMedico" DROP CONSTRAINT "TurnoMedico_pkey";
       public            marito    false    238    238            ?           2606    17104 "   UnidadHospital UnidadHospital_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "UnidadHospital_pkey" PRIMARY KEY (id_hospital, tipo_unidad);
 P   ALTER TABLE ONLY public."UnidadHospital" DROP CONSTRAINT "UnidadHospital_pkey";
       public            marito    false    239    239            J           2606    17651 '   EquipoQuirurgico FK_AGENDAMIENTO_EQUIPO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_AGENDAMIENTO_EQUIPO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);
 U   ALTER TABLE ONLY public."EquipoQuirurgico" DROP CONSTRAINT "FK_AGENDAMIENTO_EQUIPO";
       public          marito    false    3289    265    262            M           2606    17684 '   Instrumento FK_AGENDAMIENTO_INSTRUMENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_AGENDAMIENTO_INSTRUMENTO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);
 U   ALTER TABLE ONLY public."Instrumento" DROP CONSTRAINT "FK_AGENDAMIENTO_INSTRUMENTO";
       public          marito    false    262    3289    268            I           2606    17638    Insumo FK_AGENDAMIENTO_INSUMO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "FK_AGENDAMIENTO_INSUMO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);
 K   ALTER TABLE ONLY public."Insumo" DROP CONSTRAINT "FK_AGENDAMIENTO_INSUMO";
       public          marito    false    264    263    3291            [           2606    17811 +   ChequeoPreanestesico FK_ANESTESISTA_CHEQUEO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_ANESTESISTA_CHEQUEO" FOREIGN KEY (medico_anestesista) REFERENCES public."Personal"(persona);
 Y   ALTER TABLE ONLY public."ChequeoPreanestesico" DROP CONSTRAINT "FK_ANESTESISTA_CHEQUEO";
       public          marito    false    3237    233    279            F           2606    17568 +   Procedimiento FK_AUTORIZACION_PROCEDIMIENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_AUTORIZACION_PROCEDIMIENTO" FOREIGN KEY (persona_autorizacion) REFERENCES public."PersonaRegistrada"(dpi);
 Y   ALTER TABLE ONLY public."Procedimiento" DROP CONSTRAINT "FK_AUTORIZACION_PROCEDIMIENTO";
       public          marito    false    3235    261    232            (           2606    17316 *   AsignacionAyudante FK_AYUDANTE_ASIGNACIONA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "FK_AYUDANTE_ASIGNACIONA" FOREIGN KEY (ayudante) REFERENCES public."Ayudante"(dpi);
 X   ALTER TABLE ONLY public."AsignacionAyudante" DROP CONSTRAINT "FK_AYUDANTE_ASIGNACIONA";
       public          marito    false    203    3199    242            1           2606    17377 #   Intraoperatorio FK_CCONDICION_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CCONDICION_INTRA" FOREIGN KEY (confirmacion_buena_condicion) REFERENCES public."TipoCondicion"(id);
 Q   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CCONDICION_INTRA";
       public          marito    false    3253    244    245            3           2606    17387    Intraoperatorio FK_CCONF_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CCONF_INTRA" FOREIGN KEY (configuracion_suministro) REFERENCES public."TipoCondicion"(id);
 L   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CCONF_INTRA";
       public          marito    false    245    244    3253            /           2606    17367     Intraoperatorio FK_CEQUIPO_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CEQUIPO_INTRA" FOREIGN KEY (confirmacion_equipo) REFERENCES public."TipoCondicion"(id);
 N   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CEQUIPO_INTRA";
       public          marito    false    245    244    3253            D           2606    17558 &   Procedimiento FK_CHEQUEO_PROCEDIMIENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_CHEQUEO_PROCEDIMIENTO" FOREIGN KEY (chequeo_consentimiento) REFERENCES public."Preoperatoria"(cirugia);
 T   ALTER TABLE ONLY public."Procedimiento" DROP CONSTRAINT "FK_CHEQUEO_PROCEDIMIENTO";
       public          marito    false    261    247    3259            G           2606    17615 .   AgendamientoQuirurgico FK_CIRUGIA_AGENDAMIENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AgendamientoQuirurgico"
    ADD CONSTRAINT "FK_CIRUGIA_AGENDAMIENTO" FOREIGN KEY (preoperatoria) REFERENCES public."Preoperatoria"(cirugia);
 \   ALTER TABLE ONLY public."AgendamientoQuirurgico" DROP CONSTRAINT "FK_CIRUGIA_AGENDAMIENTO";
       public          marito    false    3259    247    262            '           2606    17306 -   AsignacionMedicoCirugia FK_CIRUGIA_ASIGNACION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "FK_CIRUGIA_ASIGNACION" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);
 [   ALTER TABLE ONLY public."AsignacionMedicoCirugia" DROP CONSTRAINT "FK_CIRUGIA_ASIGNACION";
       public          marito    false    206    3203    241            )           2606    17321 )   AsignacionAyudante FK_CIRUGIA_ASIGNACIONA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AsignacionAyudante"
    ADD CONSTRAINT "FK_CIRUGIA_ASIGNACIONA" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);
 W   ALTER TABLE ONLY public."AsignacionAyudante" DROP CONSTRAINT "FK_CIRUGIA_ASIGNACIONA";
       public          marito    false    242    206    3203            *           2606    17342     Intraoperatorio FK_CIRUGIA_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CIRUGIA_INTRA" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);
 N   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CIRUGIA_INTRA";
       public          marito    false    206    245    3203            4           2606    17397    Postoperatorio FK_CIRUGIA_POST    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "FK_CIRUGIA_POST" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);
 L   ALTER TABLE ONLY public."Postoperatorio" DROP CONSTRAINT "FK_CIRUGIA_POST";
       public          marito    false    246    3203    206            6           2606    17415 &   Preoperatoria FK_CIRUGIA_PREOPERATORIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Preoperatoria"
    ADD CONSTRAINT "FK_CIRUGIA_PREOPERATORIO" FOREIGN KEY (cirugia) REFERENCES public."Cirugia"(id);
 T   ALTER TABLE ONLY public."Preoperatoria" DROP CONSTRAINT "FK_CIRUGIA_PREOPERATORIO";
       public          marito    false    206    3203    247                       2606    17105    Consulta FK_CITA_CONSULTA    FK CONSTRAINT        ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_CITA_CONSULTA" FOREIGN KEY (cita) REFERENCES public."FichaCita"(id);
 G   ALTER TABLE ONLY public."Consulta" DROP CONSTRAINT "FK_CITA_CONSULTA";
       public          marito    false    219    3219    212            Z           2606    17806 ,   ChequeoPreanestesico FK_CLASIFICADOR_CHEQUEO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_CLASIFICADOR_CHEQUEO" FOREIGN KEY (medico_clasificador) REFERENCES public."Personal"(persona);
 Z   ALTER TABLE ONLY public."ChequeoPreanestesico" DROP CONSTRAINT "FK_CLASIFICADOR_CHEQUEO";
       public          marito    false    279    233    3237                       2606    17110    Consulta FK_CLINICA_CONSULTA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_CLINICA_CONSULTA" FOREIGN KEY (clinica) REFERENCES public."Clinica"(numero_clinica);
 J   ALTER TABLE ONLY public."Consulta" DROP CONSTRAINT "FK_CLINICA_CONSULTA";
       public          marito    false    208    212    3205                       2606    17115    FichaEgreso FK_CODIGO_EGRESO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FK_CODIGO_EGRESO" FOREIGN KEY (codigo_egreso) REFERENCES public."CodigoEgreso"(id) NOT VALID;
 J   ALTER TABLE ONLY public."FichaEgreso" DROP CONSTRAINT "FK_CODIGO_EGRESO";
       public          marito    false    221    210    3207            Y           2606    17793 %   Prescripcion FK_CONSULTA_PRESCRIPCION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "FK_CONSULTA_PRESCRIPCION" FOREIGN KEY (medicamento) REFERENCES public."Medicamento"(id);
 S   ALTER TABLE ONLY public."Prescripcion" DROP CONSTRAINT "FK_CONSULTA_PRESCRIPCION";
       public          marito    false    227    3229    278            0           2606    17372 "   Intraoperatorio FK_CPACIENTE_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPACIENTE_INTRA" FOREIGN KEY (confirmacion_paciente) REFERENCES public."TipoCondicion"(id);
 P   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CPACIENTE_INTRA";
       public          marito    false    3253    245    244            .           2606    17362    Intraoperatorio FK_CPLACA_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPLACA_INTRA" FOREIGN KEY (placa_instalada) REFERENCES public."TipoCondicion"(id);
 M   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CPLACA_INTRA";
       public          marito    false    244    3253    245            -           2606    17357 )   Intraoperatorio FK_CPOSICIONAMIENTO_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPOSICIONAMIENTO_INTRA" FOREIGN KEY (posicionamiento_correcto) REFERENCES public."TipoCondicion"(id);
 W   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CPOSICIONAMIENTO_INTRA";
       public          marito    false    245    244    3253            +           2606    17347 #   Intraoperatorio FK_CPRESENCIA_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CPRESENCIA_INTRA" FOREIGN KEY (presencia_completa) REFERENCES public."TipoCondicion"(id);
 Q   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CPRESENCIA_INTRA";
       public          marito    false    245    3253    244            2           2606    17382 "   Intraoperatorio FK_CREVISION_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CREVISION_INTRA" FOREIGN KEY (revision) REFERENCES public."TipoCondicion"(id);
 P   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CREVISION_INTRA";
       public          marito    false    245    3253    244            ,           2606    17352 "   Intraoperatorio FK_CTRASLADO_INTRA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Intraoperatorio"
    ADD CONSTRAINT "FK_CTRASLADO_INTRA" FOREIGN KEY (traslado_correcto) REFERENCES public."TipoCondicion"(id);
 P   ALTER TABLE ONLY public."Intraoperatorio" DROP CONSTRAINT "FK_CTRASLADO_INTRA";
       public          marito    false    244    3253    245                       2606    17120 !   FichaTraslado FK_DESTINO_TRASLADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_DESTINO_TRASLADO" FOREIGN KEY (hospital_destino, unidad_destino) REFERENCES public."UnidadHospital"(id_hospital, tipo_unidad);
 O   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FK_DESTINO_TRASLADO";
       public          marito    false    3245    224    239    239    224                       2606    17125 +   DiagnosticoSecundario FK_EGRESO_DIAGNOSTICO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."DiagnosticoSecundario"
    ADD CONSTRAINT "FK_EGRESO_DIAGNOSTICO" FOREIGN KEY (egreso) REFERENCES public."FichaEgreso"(id_ficha);
 Y   ALTER TABLE ONLY public."DiagnosticoSecundario" DROP CONSTRAINT "FK_EGRESO_DIAGNOSTICO";
       public          marito    false    3221    221    213                       2606    17130    FichaIngreso FK_ENCARGADO_FICHA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_ENCARGADO_FICHA" FOREIGN KEY (encargado, paciente) REFERENCES public."Encargado"(persona, paciente);
 M   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FK_ENCARGADO_FICHA";
       public          marito    false    214    3213    222    222    214                       2606    17135    Cirugia FK_ESPECIALIDAD_CIRUGIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "FK_ESPECIALIDAD_CIRUGIA" FOREIGN KEY (tipo) REFERENCES public."Cirugia"(id) NOT VALID;
 M   ALTER TABLE ONLY public."Cirugia" DROP CONSTRAINT "FK_ESPECIALIDAD_CIRUGIA";
       public          marito    false    206    206    3203                       2606    17140 '   MedicoConsulta FK_ESPECIALIDAD_CONSULTA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "FK_ESPECIALIDAD_CONSULTA" FOREIGN KEY (especialidad) REFERENCES public."EspecialidadConsulta"(id);
 U   ALTER TABLE ONLY public."MedicoConsulta" DROP CONSTRAINT "FK_ESPECIALIDAD_CONSULTA";
       public          marito    false    217    229    3217            %           2606    17291 $   MedicoCirugia FK_ESPECIALIDAD_MEDICO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "FK_ESPECIALIDAD_MEDICO" FOREIGN KEY (especialidad) REFERENCES public."EspecialidadCirugia"(id);
 R   ALTER TABLE ONLY public."MedicoCirugia" DROP CONSTRAINT "FK_ESPECIALIDAD_MEDICO";
       public          marito    false    3215    215    240            @           2606    17515 #   ExploracionAbdomen FK_EXPLO_ABDOMEN    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionAbdomen"
    ADD CONSTRAINT "FK_EXPLO_ABDOMEN" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 Q   ALTER TABLE ONLY public."ExploracionAbdomen" DROP CONSTRAINT "FK_EXPLO_ABDOMEN";
       public          marito    false    247    257    3259            =           2606    17485 !   ExploracionCabeza FK_EXPLO_CABEZA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCabeza"
    ADD CONSTRAINT "FK_EXPLO_CABEZA" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 O   ALTER TABLE ONLY public."ExploracionCabeza" DROP CONSTRAINT "FK_EXPLO_CABEZA";
       public          marito    false    254    3259    247            C           2606    17545 #   ExploracionCavidad FK_EXPLO_CAVIDAD    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCavidad"
    ADD CONSTRAINT "FK_EXPLO_CAVIDAD" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 Q   ALTER TABLE ONLY public."ExploracionCavidad" DROP CONSTRAINT "FK_EXPLO_CAVIDAD";
       public          marito    false    247    260    3259            B           2606    17535 #   ExploracionColumna FK_EXPLO_COLUMNA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionColumna"
    ADD CONSTRAINT "FK_EXPLO_COLUMNA" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 Q   ALTER TABLE ONLY public."ExploracionColumna" DROP CONSTRAINT "FK_EXPLO_COLUMNA";
       public          marito    false    247    259    3259            >           2606    17495 !   ExploracionCuello FK_EXPLO_CUELLO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionCuello"
    ADD CONSTRAINT "FK_EXPLO_CUELLO" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 O   ALTER TABLE ONLY public."ExploracionCuello" DROP CONSTRAINT "FK_EXPLO_CUELLO";
       public          marito    false    3259    247    255            A           2606    17525 )   ExploracionExtremidad FK_EXPLO_EXTREMIDAD    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionExtremidad"
    ADD CONSTRAINT "FK_EXPLO_EXTREMIDAD" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 W   ALTER TABLE ONLY public."ExploracionExtremidad" DROP CONSTRAINT "FK_EXPLO_EXTREMIDAD";
       public          marito    false    247    258    3259            ?           2606    17505    ExploracionTorax FK_EXPLO_TORAX    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ExploracionTorax"
    ADD CONSTRAINT "FK_EXPLO_TORAX" FOREIGN KEY (exploracion_fisica) REFERENCES public."Preoperatoria"(cirugia);
 M   ALTER TABLE ONLY public."ExploracionTorax" DROP CONSTRAINT "FK_EXPLO_TORAX";
       public          marito    false    256    247    3259            Q           2606    17712 &   PacienteEmergencia FK_FICHA_EMERGENCIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "FK_FICHA_EMERGENCIA" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);
 T   ALTER TABLE ONLY public."PacienteEmergencia" DROP CONSTRAINT "FK_FICHA_EMERGENCIA";
       public          marito    false    270    222    3223            ]           2606    17829 0   HospitalizacionPaciente FK_FICHA_HOSPITALIZACION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."HospitalizacionPaciente"
    ADD CONSTRAINT "FK_FICHA_HOSPITALIZACION" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);
 ^   ALTER TABLE ONLY public."HospitalizacionPaciente" DROP CONSTRAINT "FK_FICHA_HOSPITALIZACION";
       public          marito    false    222    281    3223            L           2606    17666 "   EquipoQuirurgico FK_FUNCION_EQUIPO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_FUNCION_EQUIPO" FOREIGN KEY (funcion) REFERENCES public."FuncionEquipo"(id) NOT VALID;
 P   ALTER TABLE ONLY public."EquipoQuirurgico" DROP CONSTRAINT "FK_FUNCION_EQUIPO";
       public          marito    false    266    265    3297            O           2606    17694 "   Instrumento FK_FUNCION_INSTRUMENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_FUNCION_INSTRUMENTO" FOREIGN KEY (funcion) REFERENCES public."FuncionInstrumento"(id);
 P   ALTER TABLE ONLY public."Instrumento" DROP CONSTRAINT "FK_FUNCION_INSTRUMENTO";
       public          marito    false    268    267    3299            ^           2606    17839 /   InsumoHospitalizacion FK_HOSPITALIZACION_INSUMO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."InsumoHospitalizacion"
    ADD CONSTRAINT "FK_HOSPITALIZACION_INSUMO" FOREIGN KEY (hospitalizacion_paciente) REFERENCES public."HospitalizacionPaciente"(id);
 ]   ALTER TABLE ONLY public."InsumoHospitalizacion" DROP CONSTRAINT "FK_HOSPITALIZACION_INSUMO";
       public          marito    false    3321    281    282            _           2606    17857 ,   ServicioObtenido FK_HOSPITALIZACION_SERVICIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "FK_HOSPITALIZACION_SERVICIO" FOREIGN KEY (hospitalizacion_paciente) REFERENCES public."HospitalizacionPaciente"(id);
 Z   ALTER TABLE ONLY public."ServicioObtenido" DROP CONSTRAINT "FK_HOSPITALIZACION_SERVICIO";
       public          marito    false    281    285    3321                       2606    17145 -   CalificacionHospital FK_HOSPITAL_CALIFICACION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."CalificacionHospital"
    ADD CONSTRAINT "FK_HOSPITAL_CALIFICACION" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);
 [   ALTER TABLE ONLY public."CalificacionHospital" DROP CONSTRAINT "FK_HOSPITAL_CALIFICACION";
       public          marito    false    204    225    3227                       2606    17602    FichaCita FK_HOSPITAL_CITA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_HOSPITAL_CITA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id) NOT VALID;
 H   ALTER TABLE ONLY public."FichaCita" DROP CONSTRAINT "FK_HOSPITAL_CITA";
       public          marito    false    219    225    3227                       2606    17150    Clinica FK_HOSPITAL_CLINICA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Clinica"
    ADD CONSTRAINT "FK_HOSPITAL_CLINICA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);
 I   ALTER TABLE ONLY public."Clinica" DROP CONSTRAINT "FK_HOSPITAL_CLINICA";
       public          marito    false    225    208    3227                       2606    17155    FichaIngreso FK_HOSPITAL_FICHA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_HOSPITAL_FICHA" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);
 L   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FK_HOSPITAL_FICHA";
       public          marito    false    222    225    3227                       2606    17160    Personal FK_HOSPITAL_PERSONAL    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_HOSPITAL_PERSONAL" FOREIGN KEY (hospital) REFERENCES public."Hospital"(id);
 K   ALTER TABLE ONLY public."Personal" DROP CONSTRAINT "FK_HOSPITAL_PERSONAL";
       public          marito    false    233    225    3227            "           2606    17165 !   UnidadHospital FK_HOSPITAL_UNIDAD    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "FK_HOSPITAL_UNIDAD" FOREIGN KEY (id_hospital) REFERENCES public."Hospital"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public."UnidadHospital" DROP CONSTRAINT "FK_HOSPITAL_UNIDAD";
       public          marito    false    3227    239    225                       2606    17170    Cirugia FK_INGRESO_CIRUGIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Cirugia"
    ADD CONSTRAINT "FK_INGRESO_CIRUGIA" FOREIGN KEY (ficha_ingreso) REFERENCES public."FichaIngreso"(id);
 H   ALTER TABLE ONLY public."Cirugia" DROP CONSTRAINT "FK_INGRESO_CIRUGIA";
       public          marito    false    206    222    3223                       2606    17175    FichaEgreso FK_INGRESO_EGRESO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaEgreso"
    ADD CONSTRAINT "FK_INGRESO_EGRESO" FOREIGN KEY (id_ficha) REFERENCES public."FichaIngreso"(id);
 K   ALTER TABLE ONLY public."FichaEgreso" DROP CONSTRAINT "FK_INGRESO_EGRESO";
       public          marito    false    222    3223    221                       2606    17180 !   FichaTraslado FK_INGRESO_TRASLADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_INGRESO_TRASLADO" FOREIGN KEY (ingreso) REFERENCES public."FichaIngreso"(id);
 O   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FK_INGRESO_TRASLADO";
       public          marito    false    222    3223    224            ;           2606    17465 (   SintomaAparato FK_INTERROGATORIO_APARATO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SintomaAparato"
    ADD CONSTRAINT "FK_INTERROGATORIO_APARATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 V   ALTER TABLE ONLY public."SintomaAparato" DROP CONSTRAINT "FK_INTERROGATORIO_APARATO";
       public          marito    false    252    247    3259            <           2606    17475 '   EstudioPrevio FK_INTERROGATORIO_ESTUDIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."EstudioPrevio"
    ADD CONSTRAINT "FK_INTERROGATORIO_ESTUDIO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 U   ALTER TABLE ONLY public."EstudioPrevio" DROP CONSTRAINT "FK_INTERROGATORIO_ESTUDIO";
       public          marito    false    253    247    3259            :           2606    17455 (   SintomaGeneral FK_INTERROGATORIO_GENERAL    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SintomaGeneral"
    ADD CONSTRAINT "FK_INTERROGATORIO_GENERAL" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 V   ALTER TABLE ONLY public."SintomaGeneral" DROP CONSTRAINT "FK_INTERROGATORIO_GENERAL";
       public          marito    false    3259    251    247            7           2606    17425 2   AntecedenteHeredofamiliar FK_INTERROGATORIO_HEREDO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedenteHeredofamiliar"
    ADD CONSTRAINT "FK_INTERROGATORIO_HEREDO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 `   ALTER TABLE ONLY public."AntecedenteHeredofamiliar" DROP CONSTRAINT "FK_INTERROGATORIO_HEREDO";
       public          marito    false    3259    247    248            8           2606    17435 /   AntecedenteNoPatologico FK_INTERROGATORIO_NPATO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedenteNoPatologico"
    ADD CONSTRAINT "FK_INTERROGATORIO_NPATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 ]   ALTER TABLE ONLY public."AntecedenteNoPatologico" DROP CONSTRAINT "FK_INTERROGATORIO_NPATO";
       public          marito    false    249    247    3259            9           2606    17445 ,   AntecedentePatologico FK_INTERROGATORIO_PATO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AntecedentePatologico"
    ADD CONSTRAINT "FK_INTERROGATORIO_PATO" FOREIGN KEY (interrogatorio) REFERENCES public."Preoperatoria"(cirugia);
 Z   ALTER TABLE ONLY public."AntecedentePatologico" DROP CONSTRAINT "FK_INTERROGATORIO_PATO";
       public          marito    false    247    250    3259            X           2606    17788 (   Prescripcion FK_MEDICAMENTO_PRESCRIPCION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Prescripcion"
    ADD CONSTRAINT "FK_MEDICAMENTO_PRESCRIPCION" FOREIGN KEY (consulta) REFERENCES public."Consulta"(cita);
 V   ALTER TABLE ONLY public."Prescripcion" DROP CONSTRAINT "FK_MEDICAMENTO_PRESCRIPCION";
       public          marito    false    278    3209    212            &           2606    17301 ,   AsignacionMedicoCirugia FK_MEDICO_ASIGNACION    FK CONSTRAINT     ?   ALTER TABLE ONLY public."AsignacionMedicoCirugia"
    ADD CONSTRAINT "FK_MEDICO_ASIGNACION" FOREIGN KEY (medico, tipo_cirugia) REFERENCES public."MedicoCirugia"(medico, especialidad);
 Z   ALTER TABLE ONLY public."AsignacionMedicoCirugia" DROP CONSTRAINT "FK_MEDICO_ASIGNACION";
       public          marito    false    3247    240    240    241    241            $           2606    17286    MedicoCirugia FK_MEDICO_CIRUGIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MedicoCirugia"
    ADD CONSTRAINT "FK_MEDICO_CIRUGIA" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);
 M   ALTER TABLE ONLY public."MedicoCirugia" DROP CONSTRAINT "FK_MEDICO_CIRUGIA";
       public          marito    false    3237    233    240                       2606    17185    FichaCita FK_MEDICO_CITA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_MEDICO_CITA" FOREIGN KEY (medico) REFERENCES public."MedicoConsulta"(medico) NOT VALID;
 F   ALTER TABLE ONLY public."FichaCita" DROP CONSTRAINT "FK_MEDICO_CITA";
       public          marito    false    3231    219    229                       2606    17190    FichaIngreso FK_MEDICO_FICHA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_MEDICO_FICHA" FOREIGN KEY (medico_encargado) REFERENCES public."Personal"(persona);
 J   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FK_MEDICO_FICHA";
       public          marito    false    3237    233    222            E           2606    17563 %   Procedimiento FK_MEDICO_PROCEDIMIENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Procedimiento"
    ADD CONSTRAINT "FK_MEDICO_PROCEDIMIENTO" FOREIGN KEY (medico, tipo_procedimiento) REFERENCES public."MedicoCirugia"(medico, especialidad);
 S   ALTER TABLE ONLY public."Procedimiento" DROP CONSTRAINT "FK_MEDICO_PROCEDIMIENTO";
       public          marito    false    240    261    3247    261    240                       2606    17195     FichaTraslado FK_MEDICO_TRASLADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_MEDICO_TRASLADO" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);
 N   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FK_MEDICO_TRASLADO";
       public          marito    false    233    224    3237            !           2606    17200    TurnoMedico FK_MEDICO_TURNO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."TurnoMedico"
    ADD CONSTRAINT "FK_MEDICO_TURNO" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);
 I   ALTER TABLE ONLY public."TurnoMedico" DROP CONSTRAINT "FK_MEDICO_TURNO";
       public          marito    false    233    3237    238                       2606    17205     FichaTraslado FK_ORIGEN_TRASLADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_ORIGEN_TRASLADO" FOREIGN KEY (unidad_origen, hospital_origen) REFERENCES public."UnidadHospital"(tipo_unidad, id_hospital);
 N   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FK_ORIGEN_TRASLADO";
       public          marito    false    224    239    224    3245    239                       2606    17210    FichaCita FK_PACIENTE_CITA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_PACIENTE_CITA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente) NOT VALID;
 H   ALTER TABLE ONLY public."FichaCita" DROP CONSTRAINT "FK_PACIENTE_CITA";
       public          marito    false    219    230    3233            S           2606    17735 0   ProcedimientoDiagnostico FK_PACIENTE_DIAGNOSTICO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProcedimientoDiagnostico"
    ADD CONSTRAINT "FK_PACIENTE_DIAGNOSTICO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);
 ^   ALTER TABLE ONLY public."ProcedimientoDiagnostico" DROP CONSTRAINT "FK_PACIENTE_DIAGNOSTICO";
       public          marito    false    272    270    3303            P           2606    17707 )   PacienteEmergencia FK_PACIENTE_EMERGENCIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PacienteEmergencia"
    ADD CONSTRAINT "FK_PACIENTE_EMERGENCIA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente);
 W   ALTER TABLE ONLY public."PacienteEmergencia" DROP CONSTRAINT "FK_PACIENTE_EMERGENCIA";
       public          marito    false    270    230    3233            	           2606    17215    Encargado FK_PACIENTE_ENCARGADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "FK_PACIENTE_ENCARGADO" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente) NOT VALID;
 M   ALTER TABLE ONLY public."Encargado" DROP CONSTRAINT "FK_PACIENTE_ENCARGADO";
       public          marito    false    3233    214    230                       2606    17220    FichaIngreso FK_PACIENTE_FICHA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_PACIENTE_FICHA" FOREIGN KEY (paciente) REFERENCES public."Paciente"(no_expediente);
 L   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FK_PACIENTE_FICHA";
       public          marito    false    3233    230    222            T           2606    17745    Patologia FK_PACIENTE_PATOLOGIA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Patologia"
    ADD CONSTRAINT "FK_PACIENTE_PATOLOGIA" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);
 M   ALTER TABLE ONLY public."Patologia" DROP CONSTRAINT "FK_PACIENTE_PATOLOGIA";
       public          marito    false    273    270    3303            R           2606    17722 %   ProcesoQuirurgico FK_PACIENTE_PROCESO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProcesoQuirurgico"
    ADD CONSTRAINT "FK_PACIENTE_PROCESO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);
 S   ALTER TABLE ONLY public."ProcesoQuirurgico" DROP CONSTRAINT "FK_PACIENTE_PROCESO";
       public          marito    false    271    270    3303            V           2606    17773 '   ServicioEmergencia FK_PACIENTE_SERVICIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "FK_PACIENTE_SERVICIO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);
 U   ALTER TABLE ONLY public."ServicioEmergencia" DROP CONSTRAINT "FK_PACIENTE_SERVICIO";
       public          marito    false    277    270    3303            U           2606    17755 *   ProcesoTerapeutico FK_PACIENTE_TERAPEUTICO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProcesoTerapeutico"
    ADD CONSTRAINT "FK_PACIENTE_TERAPEUTICO" FOREIGN KEY (paciente_emergencia) REFERENCES public."PacienteEmergencia"(id);
 X   ALTER TABLE ONLY public."ProcesoTerapeutico" DROP CONSTRAINT "FK_PACIENTE_TERAPEUTICO";
       public          marito    false    270    274    3303                        2606    17867    Ayudante FK_PERSONAL_AYUDANTE    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Ayudante"
    ADD CONSTRAINT "FK_PERSONAL_AYUDANTE" FOREIGN KEY (dpi) REFERENCES public."Personal"(persona) NOT VALID;
 K   ALTER TABLE ONLY public."Ayudante" DROP CONSTRAINT "FK_PERSONAL_AYUDANTE";
       public          marito    false    233    203    3237                       2606    17225 #   MedicoConsulta FK_PERSONAL_CONSULTA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MedicoConsulta"
    ADD CONSTRAINT "FK_PERSONAL_CONSULTA" FOREIGN KEY (medico) REFERENCES public."Personal"(persona);
 Q   ALTER TABLE ONLY public."MedicoConsulta" DROP CONSTRAINT "FK_PERSONAL_CONSULTA";
       public          marito    false    229    233    3237                       2606    17235    Paciente FK_PERSONA_PACIENTE    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "FK_PERSONA_PACIENTE" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi);
 J   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "FK_PERSONA_PACIENTE";
       public          marito    false    3235    230    232                       2606    17240    Personal FK_PERSONA_PERSONAL    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_PERSONA_PERSONAL" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi);
 J   ALTER TABLE ONLY public."Personal" DROP CONSTRAINT "FK_PERSONA_PERSONAL";
       public          marito    false    3235    232    233            
           2606    17245    Encargado FK_PERSOSNA_ENCARGADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Encargado"
    ADD CONSTRAINT "FK_PERSOSNA_ENCARGADO" FOREIGN KEY (persona) REFERENCES public."PersonaRegistrada"(dpi) NOT VALID;
 M   ALTER TABLE ONLY public."Encargado" DROP CONSTRAINT "FK_PERSOSNA_ENCARGADO";
       public          marito    false    214    3235    232            \           2606    17816 -   ChequeoPreanestesico FK_PREOPERATORIO_CHEQUEO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ChequeoPreanestesico"
    ADD CONSTRAINT "FK_PREOPERATORIO_CHEQUEO" FOREIGN KEY (preoperatorio) REFERENCES public."Preoperatoria"(cirugia);
 [   ALTER TABLE ONLY public."ChequeoPreanestesico" DROP CONSTRAINT "FK_PREOPERATORIO_CHEQUEO";
       public          marito    false    247    3259    279                       2606    17250    Consulta FK_PROXIMA_CONSULTA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Consulta"
    ADD CONSTRAINT "FK_PROXIMA_CONSULTA" FOREIGN KEY (proxima_cita) REFERENCES public."FichaCita"(id);
 J   ALTER TABLE ONLY public."Consulta" DROP CONSTRAINT "FK_PROXIMA_CONSULTA";
       public          marito    false    3219    219    212                       2606    17255    FichaCita FK_REPROGRAMADO_CITA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaCita"
    ADD CONSTRAINT "FK_REPROGRAMADO_CITA" FOREIGN KEY (reprogramada) REFERENCES public."FichaCita"(id) NOT VALID;
 L   ALTER TABLE ONLY public."FichaCita" DROP CONSTRAINT "FK_REPROGRAMADO_CITA";
       public          marito    false    219    3219    219            W           2606    17778 '   ServicioEmergencia FK_SERVICIO_SERVICIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioEmergencia"
    ADD CONSTRAINT "FK_SERVICIO_SERVICIO" FOREIGN KEY (servicio) REFERENCES public."Servicio"(id);
 U   ALTER TABLE ONLY public."ServicioEmergencia" DROP CONSTRAINT "FK_SERVICIO_SERVICIO";
       public          marito    false    277    3313    276            `           2606    17862 %   ServicioObtenido FK_SERVICIO_SERVICIO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ServicioObtenido"
    ADD CONSTRAINT "FK_SERVICIO_SERVICIO" FOREIGN KEY (servicio_hospitalizacion) REFERENCES public."ServicioHospitalizacion"(id);
 S   ALTER TABLE ONLY public."ServicioObtenido" DROP CONSTRAINT "FK_SERVICIO_SERVICIO";
       public          marito    false    285    284    3325                       2606    17260 #   FichaTraslado FK_SIGUIENTE_TRASLADO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaTraslado"
    ADD CONSTRAINT "FK_SIGUIENTE_TRASLADO" FOREIGN KEY (ficha_ingreso_siguiente) REFERENCES public."FichaIngreso"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."FichaTraslado" DROP CONSTRAINT "FK_SIGUIENTE_TRASLADO";
       public          marito    false    222    3223    224            K           2606    17656    EquipoQuirurgico FK_TIPO_EQUIPO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."EquipoQuirurgico"
    ADD CONSTRAINT "FK_TIPO_EQUIPO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);
 M   ALTER TABLE ONLY public."EquipoQuirurgico" DROP CONSTRAINT "FK_TIPO_EQUIPO";
       public          marito    false    263    265    3291            N           2606    17689    Instrumento FK_TIPO_INSTRUMENTO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Instrumento"
    ADD CONSTRAINT "FK_TIPO_INSTRUMENTO" FOREIGN KEY (tipo) REFERENCES public."TipoObjeto"(id);
 M   ALTER TABLE ONLY public."Instrumento" DROP CONSTRAINT "FK_TIPO_INSTRUMENTO";
       public          marito    false    263    268    3291            H           2606    17633    Insumo FK_TIPO_INSUMO    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Insumo"
    ADD CONSTRAINT "FK_TIPO_INSUMO" FOREIGN KEY (agendamiento) REFERENCES public."AgendamientoQuirurgico"(preoperatoria);
 C   ALTER TABLE ONLY public."Insumo" DROP CONSTRAINT "FK_TIPO_INSUMO";
       public          marito    false    264    262    3289                        2606    17265    Personal FK_TIPO_PERSONAL    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Personal"
    ADD CONSTRAINT "FK_TIPO_PERSONAL" FOREIGN KEY (tipo) REFERENCES public."TipoPersonal"(id);
 G   ALTER TABLE ONLY public."Personal" DROP CONSTRAINT "FK_TIPO_PERSONAL";
       public          marito    false    233    234    3239            5           2606    17402    Postoperatorio FK_TRASLADO_POST    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Postoperatorio"
    ADD CONSTRAINT "FK_TRASLADO_POST" FOREIGN KEY (ficha_traslado) REFERENCES public."FichaTraslado"(ingreso);
 M   ALTER TABLE ONLY public."Postoperatorio" DROP CONSTRAINT "FK_TRASLADO_POST";
       public          marito    false    246    3225    224                       2606    17270    FichaIngreso FK_UNIDAD_FICHA    FK CONSTRAINT     ?   ALTER TABLE ONLY public."FichaIngreso"
    ADD CONSTRAINT "FK_UNIDAD_FICHA" FOREIGN KEY (unidad_medica) REFERENCES public."TipoUnidad"(id);
 J   ALTER TABLE ONLY public."FichaIngreso" DROP CONSTRAINT "FK_UNIDAD_FICHA";
       public          marito    false    3241    222    236            #           2606    17275 !   UnidadHospital FK_UNIDAD_HOSPITAL    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UnidadHospital"
    ADD CONSTRAINT "FK_UNIDAD_HOSPITAL" FOREIGN KEY (tipo_unidad) REFERENCES public."TipoUnidad"(id) NOT VALID;
 O   ALTER TABLE ONLY public."UnidadHospital" DROP CONSTRAINT "FK_UNIDAD_HOSPITAL";
       public          marito    false    236    239    3241           