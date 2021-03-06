PGDMP         #                y            Hospital #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1) #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1) W    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16489    Hospital    DATABASE     |   CREATE DATABASE "Hospital" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_GT.UTF-8' LC_CTYPE = 'es_GT.UTF-8';
    DROP DATABASE "Hospital";
                marito    false            ?          0    17016    PersonaRegistrada 
   TABLE DATA           ?   COPY public."PersonaRegistrada" (dpi, nombres, apellidos, telefono, municipio, departamento, area, fecha_nacimiento, edad) FROM stdin;
    public          marito    false    232   ?P       ?          0    17011    Paciente 
   TABLE DATA           <   COPY public."Paciente" (no_expediente, persona) FROM stdin;
    public          marito    false    230   ?Q       ?          0    16957 	   Encargado 
   TABLE DATA           D   COPY public."Encargado" (persona, paciente, parentesco) FROM stdin;
    public          marito    false    214   ?Q       ?          0    16995    Hospital 
   TABLE DATA           U   COPY public."Hospital" (id, informacion_especifica, telefono, direccion) FROM stdin;
    public          marito    false    225   XR       ?          0    17022    TipoPersonal 
   TABLE DATA           4   COPY public."TipoPersonal" (id, nombre) FROM stdin;
    public          marito    false    234   ?R       ?          0    17019    Personal 
   TABLE DATA           =   COPY public."Personal" (persona, tipo, hospital) FROM stdin;
    public          marito    false    233   	S                  0    17027 
   TipoUnidad 
   TABLE DATA           2   COPY public."TipoUnidad" (id, nombre) FROM stdin;
    public          marito    false    236   MS       ?          0    16984    FichaIngreso 
   TABLE DATA           ?   COPY public."FichaIngreso" (id, hospital, paciente, encargado, motivo, unidad_medica, dia, mes, "año", hora, medico_encargado, camilla_asignado, diagnostico_presuntivo) FROM stdin;
    public          marito    false    222   ?S       ?          0    16933    Cirugia 
   TABLE DATA           \   COPY public."Cirugia" (id, ficha_ingreso, tipo, precio, dia, mes, "año", hora) FROM stdin;
    public          marito    false    206   <T                 0    17407    Preoperatoria 
   TABLE DATA           ?   COPY public."Preoperatoria" (cirugia, padecimiento_actual, exploracion_general, objetivo, firma_medico, fecha_consentimiento, tabla_disponible, equipos_preparados, paciente_ingresado, confirmacion_arsenal, medicamentos_disponibles) FROM stdin;
    public          marito    false    247   zT                 0    17607    AgendamientoQuirurgico 
   TABLE DATA           ?   COPY public."AgendamientoQuirurgico" (preoperatoria, "año", mes, dia, hora, caracter, historia_clinica, tiempo_estimado, tipo_anestecia, aceptada) FROM stdin;
    public          marito    false    262   ?T                 0    17420    AntecedenteHeredofamiliar 
   TABLE DATA           R   COPY public."AntecedenteHeredofamiliar" (antecedente, interrogatorio) FROM stdin;
    public          marito    false    248   oU                 0    17430    AntecedenteNoPatologico 
   TABLE DATA           P   COPY public."AntecedenteNoPatologico" (antecedente, interrogatorio) FROM stdin;
    public          marito    false    249   ?U                 0    17440    AntecedentePatologico 
   TABLE DATA           N   COPY public."AntecedentePatologico" (antecedente, interrogatorio) FROM stdin;
    public          marito    false    250   V       ?          0    16925    Ayudante 
   TABLE DATA           /   COPY public."Ayudante" (dpi, tipo) FROM stdin;
    public          marito    false    203   GV                 0    17311    AsignacionAyudante 
   TABLE DATA           A   COPY public."AsignacionAyudante" (ayudante, cirugia) FROM stdin;
    public          marito    false    242   ?V       ?          0    16960    EspecialidadCirugia 
   TABLE DATA           ;   COPY public."EspecialidadCirugia" (id, nombre) FROM stdin;
    public          marito    false    215   ?V                 0    17281    MedicoCirugia 
   TABLE DATA           ?   COPY public."MedicoCirugia" (medico, especialidad) FROM stdin;
    public          marito    false    240   ?W                 0    17296    AsignacionMedicoCirugia 
   TABLE DATA           R   COPY public."AsignacionMedicoCirugia" (medico, cirugia, tipo_cirugia) FROM stdin;
    public          marito    false    241   ?W       ?          0    16928    CalificacionHospital 
   TABLE DATA           Y   COPY public."CalificacionHospital" (no_calificacion, hospital, calificacion) FROM stdin;
    public          marito    false    204   ?W       +          0    17798    ChequeoPreanestesico 
   TABLE DATA           ?   COPY public."ChequeoPreanestesico" (preoperatorio, clasificacion_riesgo, medico_clasificador, firma_medico, plan_anestecia, medico_anestesista) FROM stdin;
    public          marito    false    279   3X       ?          0    16938    Clinica 
   TABLE DATA           =   COPY public."Clinica" (numero_clinica, hospital) FROM stdin;
    public          marito    false    208   PX       ?          0    16943    CodigoEgreso 
   TABLE DATA           2   COPY public."CodigoEgreso" (id, tipo) FROM stdin;
    public          marito    false    210   |X       ?          0    16965    EspecialidadConsulta 
   TABLE DATA           <   COPY public."EspecialidadConsulta" (id, nombre) FROM stdin;
    public          marito    false    217   ?X       ?          0    17008    MedicoConsulta 
   TABLE DATA           @   COPY public."MedicoConsulta" (medico, especialidad) FROM stdin;
    public          marito    false    229   ?Y       ?          0    16973 	   FichaCita 
   TABLE DATA           ?   COPY public."FichaCita" (id, paciente, medico, reprogramada, dia, mes, "año", hora, cancelada, realizada, hospital) FROM stdin;
    public          marito    false    219   ?Y       ?          0    16948    Consulta 
   TABLE DATA           z   COPY public."Consulta" (cita, total, dia, mes, "año", referido, proxima_cita, notas, datos_interes, clinica) FROM stdin;
    public          marito    false    212   ?Z       ?          0    16981    FichaEgreso 
   TABLE DATA           ?   COPY public."FichaEgreso" (id_ficha, diagnostico_principal, motivo_egreso, dia, mes, "año", hora, camilla_asignado, codigo_egreso, consentido, motivo, dias_hospitalizacion, referido) FROM stdin;
    public          marito    false    221   ?Z       ?          0    16954    DiagnosticoSecundario 
   TABLE DATA           F   COPY public."DiagnosticoSecundario" (egreso, diagnostico) FROM stdin;
    public          marito    false    213   ?[                 0    17661    FuncionEquipo 
   TABLE DATA           5   COPY public."FuncionEquipo" (id, nombre) FROM stdin;
    public          marito    false    266   	\                 0    17620 
   TipoObjeto 
   TABLE DATA           2   COPY public."TipoObjeto" (id, nombre) FROM stdin;
    public          marito    false    263   f\                 0    17643    EquipoQuirurgico 
   TABLE DATA           ^   COPY public."EquipoQuirurgico" (agendamiento, nombre, descripcion, tipo, funcion) FROM stdin;
    public          marito    false    265   ?\                 0    17470    EstudioPrevio 
   TABLE DATA           B   COPY public."EstudioPrevio" (estudio, interrogatorio) FROM stdin;
    public          marito    false    253   =]                 0    17510    ExploracionAbdomen 
   TABLE DATA           S   COPY public."ExploracionAbdomen" (dato_encontrado, exploracion_fisica) FROM stdin;
    public          marito    false    257   ?]                 0    17480    ExploracionCabeza 
   TABLE DATA           R   COPY public."ExploracionCabeza" (dato_encontrado, exploracion_fisica) FROM stdin;
    public          marito    false    254   ?]                 0    17540    ExploracionCavidad 
   TABLE DATA           \   COPY public."ExploracionCavidad" (dato_encontrado, exploracion_fisica, cavidad) FROM stdin;
    public          marito    false    260   ^                 0    17530    ExploracionColumna 
   TABLE DATA           S   COPY public."ExploracionColumna" (dato_encontrado, exploracion_fisica) FROM stdin;
    public          marito    false    259   /^                 0    17490    ExploracionCuello 
   TABLE DATA           R   COPY public."ExploracionCuello" (dato_encontrado, exploracion_fisica) FROM stdin;
    public          marito    false    255   j^                 0    17520    ExploracionExtremidad 
   TABLE DATA           b   COPY public."ExploracionExtremidad" (dato_encontrado, exploracion_fisica, extremidad) FROM stdin;
    public          marito    false    258   ?^                 0    17500    ExploracionTorax 
   TABLE DATA           Q   COPY public."ExploracionTorax" (dato_encontrado, exploracion_fisica) FROM stdin;
    public          marito    false    256   ,_                 0    17038    UnidadHospital 
   TABLE DATA           Q   COPY public."UnidadHospital" (id_hospital, tipo_unidad, informacion) FROM stdin;
    public          marito    false    239   e_       ?          0    16992    FichaTraslado 
   TABLE DATA           ?   COPY public."FichaTraslado" (ingreso, dia, mes, "año", hora, consentido, unidad_origen, hospital_origen, unidad_destino, hospital_destino, ficha_ingreso_siguiente, medico) FROM stdin;
    public          marito    false    224   ?_                 0    17671    FuncionInstrumento 
   TABLE DATA           :   COPY public."FuncionInstrumento" (id, nombre) FROM stdin;
    public          marito    false    267   !`       -          0    17823    HospitalizacionPaciente 
   TABLE DATA           p   COPY public."HospitalizacionPaciente" (id, ficha_ingreso, costo, dias_internado, cancelado, cuotas) FROM stdin;
    public          marito    false    281   ?`                  0    17676    Instrumento 
   TABLE DATA           Y   COPY public."Instrumento" (agendamiento, nombre, descripcion, tipo, funcion) FROM stdin;
    public          marito    false    268   ?`                 0    17625    Insumo 
   TABLE DATA           U   COPY public."Insumo" (agendamiento, nombre, descripcion, material, tipo) FROM stdin;
    public          marito    false    264   ?`       .          0    17834    InsumoHospitalizacion 
   TABLE DATA           `   COPY public."InsumoHospitalizacion" (hospitalizacion_paciente, descripcion, precio) FROM stdin;
    public          marito    false    282   Ma                 0    17328    TipoCondicion 
   TABLE DATA           8   COPY public."TipoCondicion" (id, condicion) FROM stdin;
    public          marito    false    244   ?a       	          0    17334    Intraoperatorio 
   TABLE DATA           ?  COPY public."Intraoperatorio" (cirugia, presencia_completa, traslado_correcto, posicionamiento_correcto, placa_instalada, confirmacion_equipo, confirmacion_paciente, confirmacion_buena_condicion, revision, configuracion_suministro, plan_quirurgico, incision, registro_balance, registro_seguridad, registro_transfusion, fin_procedimiento, confirmacion_efectividad, confirmacion_conteo_instrumental, cierre_incision) FROM stdin;
    public          marito    false    245   ?a       ?          0    17003    Medicamento 
   TABLE DATA           ;   COPY public."Medicamento" (id, nombre, precio) FROM stdin;
    public          marito    false    227   Ub       "          0    17701    PacienteEmergencia 
   TABLE DATA           ?   COPY public."PacienteEmergencia" (id, paciente, estado, ficha_ingreso, prioridad, turno, consentimiento_info, total, cuotas) FROM stdin;
    public          marito    false    270   ?b       %          0    17740 	   Patologia 
   TABLE DATA           G   COPY public."Patologia" (paciente_emergencia, informacion) FROM stdin;
    public          marito    false    273   ?b       
          0    17392    Postoperatorio 
   TABLE DATA           _  COPY public."Postoperatorio" (cirugia, condicion_evolucion, confirmacion_tipo_cama, disposicion_cama, disposicion_gases, disposicion_bombas, disposicion_monitores, disposicion_electrodos, confirmacion_disposicion_personal, disposicion_portasueros, tiempo_estimado, ficha_traslado, signos_vitales, zona_operatorio_limpio, sueros_correctos) FROM stdin;
    public          marito    false    246   1c       *          0    17783    Prescripcion 
   TABLE DATA           `   COPY public."Prescripcion" (consulta, medicamento, dosis, duracion, cantidad_total) FROM stdin;
    public          marito    false    278   ~c                 0    17550    Procedimiento 
   TABLE DATA           ?   COPY public."Procedimiento" (chequeo_consentimiento, nombre, caracteristicas, riesgos, objetivo, persona_autorizacion, medico, tipo_procedimiento) FROM stdin;
    public          marito    false    261   ?c       $          0    17727    ProcedimientoDiagnostico 
   TABLE DATA           e   COPY public."ProcedimientoDiagnostico" (diagnostico, paciente_emergencia, procedimiento) FROM stdin;
    public          marito    false    272   0d       #          0    17717    ProcesoQuirurgico 
   TABLE DATA           V   COPY public."ProcesoQuirurgico" (paciente_emergencia, proceso_quirurgico) FROM stdin;
    public          marito    false    271   zd       &          0    17750    ProcesoTerapeutico 
   TABLE DATA           X   COPY public."ProcesoTerapeutico" (paciente_emergencia, proceso_terapeutico) FROM stdin;
    public          marito    false    274   ?d       (          0    17762    Servicio 
   TABLE DATA           0   COPY public."Servicio" (id, nombre) FROM stdin;
    public          marito    false    276   ?d       )          0    17768    ServicioEmergencia 
   TABLE DATA           M   COPY public."ServicioEmergencia" (servicio, paciente_emergencia) FROM stdin;
    public          marito    false    277   ?e       0          0    17846    ServicioHospitalizacion 
   TABLE DATA           J   COPY public."ServicioHospitalizacion" (id, nombre, costo_dia) FROM stdin;
    public          marito    false    284    f       1          0    17852    ServicioObtenido 
   TABLE DATA           `   COPY public."ServicioObtenido" (hospitalizacion_paciente, servicio_hospitalizacion) FROM stdin;
    public          marito    false    285   ?f                 0    17460    SintomaAparato 
   TABLE DATA           C   COPY public."SintomaAparato" (sintoma, interrogatorio) FROM stdin;
    public          marito    false    252   ?f                 0    17450    SintomaGeneral 
   TABLE DATA           C   COPY public."SintomaGeneral" (sintoma, interrogatorio) FROM stdin;
    public          marito    false    251   ^g                 0    17035    TurnoMedico 
   TABLE DATA           ;   COPY public."TurnoMedico" (medico, turno, dia) FROM stdin;
    public          marito    false    238   ?g       8           0    0 (   CalificacionHospital_no_calificacion_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."CalificacionHospital_no_calificacion_seq"', 5, true);
          public          marito    false    205            9           0    0    Cirugia_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Cirugia_id_seq"', 2, true);
          public          marito    false    207            :           0    0    Clinica_numero_clinica_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Clinica_numero_clinica_seq"', 5, true);
          public          marito    false    209            ;           0    0    CodigoEgreso_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."CodigoEgreso_id_seq"', 4, true);
          public          marito    false    211            <           0    0    EspecialidadCirugia_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."EspecialidadCirugia_id_seq"', 14, true);
          public          marito    false    216            =           0    0    EspecialidadConsulta_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."EspecialidadConsulta_id_seq"', 14, true);
          public          marito    false    218            >           0    0    FichaCita_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."FichaCita_id_seq"', 7, true);
          public          marito    false    220            ?           0    0    FichaIngreso_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."FichaIngreso_id_seq"', 5, true);
          public          marito    false    223            @           0    0    Hospital_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Hospital_id_seq"', 1, false);
          public          marito    false    226            A           0    0    HospitalizacionPaciente_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."HospitalizacionPaciente_id_seq"', 2, true);
          public          marito    false    280            B           0    0    Medicamento_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Medicamento_id_seq"', 1, false);
          public          marito    false    228            C           0    0    PacienteEmergencia_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."PacienteEmergencia_id_seq"', 1, true);
          public          marito    false    269            D           0    0    Paciente_no_expediente_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Paciente_no_expediente_seq"', 1, false);
          public          marito    false    231            E           0    0    ServicioHospitalizacion_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ServicioHospitalizacion_id_seq"', 9, true);
          public          marito    false    283            F           0    0    Servicio_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Servicio_id_seq"', 7, true);
          public          marito    false    275            G           0    0    TipoCondicion_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."TipoCondicion_id_seq"', 3, true);
          public          marito    false    243            H           0    0    TipoPersonal_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."TipoPersonal_id_seq"', 4, true);
          public          marito    false    235            I           0    0    TipoUnidad_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."TipoUnidad_id_seq"', 1, false);
          public          marito    false    237            ?   ?   x???=? ???
??tAR~P?޿@DPu?۰ŧ'jbc?AD???Łp?OSW?P̟%?Bi6?????~???m>?@??S?`iszf?9??0i?J?Ib%?/R??2ij??ْ??
?YZR͝?Jr#???BR&????eΝԕ4??i
ɉ??????!??౏?      ?   7   x?5ȹ  ??*????^????nV?6?,ў??#ƚjJ0?J2??T??; <?l?      ?   O   x?3426153???4??8S??????a *ca??????e0????)E??F?%L` f?!gFjQnb^>W? ?&      ?   [   x?3???/.?,I?Q?+?M-?W0??6426153?????J?d?&'g??ra?0«È?C?1^?\&:L??0?2??a?W?)W? ?SQ      ?   6   x?3??MM?L??2?t?KK-?M-??2?t-.)M?L?+I?2?t?,M3c???? ??      ?   4   x?5??	 0?w<L???K???????GV_??D??k.????pSν????          ?   x?3???/.?,I?ɬJL????2?t??+.?)I?2?t?M-JO?K?L?2?t?,*M?b???? ,R?      ?   ?   x?u?;?0D??)8???!?J?@BiH??s???h??2)??y?"?G???????1?E?a;e????]??????}?????>?̓~??o????F^???s??!?>?U?,??????Ꭻ?Չ׌???}???F      ?   .   x?3?4?@S=NC#N 40
Zp??9#??W? i	         k   x?????0 ??^?
{>??(U??????͇	???t?d?X????Y+.?u??=?R?pUӐ?>????w}?؄?G?a???Mb8.?C?ү??????R?#?6?         j   x?u?1
A???)r?c?a60F????A??}?c?"??R?^?-???P???:?W?Ë,?衸?{z??l??d???_?{?r??%?ȓ??????>~/f         %   x?K?LLJ-I-?4???,H-*I?+???rc???? ?g	?         M   x?E??	? г??	
?<?|5??)8~?????
?Z8I?Ѫpw??}?0d?1?b????????Xt??"? ??@         6   x?K,I,,M-VH?LLJ-?L?/?4?J-N/??KNUH?+I-??/?4?????? ?74      ?   2   x?33????????Ĕ?"??T ;? ??Фs2s2S??b???? ١?             x?33?NC.38ۈ????W? 
t	e      ?   ?   x?M??n1E뙯p??Q?T? ?4??A#?j֋?s(??h?c?P,??>t??oR?r??l????&$1????5)???8o?%E?!,|?JG?c??u*R?K??̦a?=?E??G_J??'?a??p?>Q8v???JϠ?$U???}(??r??)?C???ޢ?:?k??0?m?+?ю??5????D\?         *   x?3426153???4䲴0735162?4?2?Nc?=... ?u         )   x?3426153???4?4䲴0735162?4?4?????? c?a      ?   (   x?3?4?4?2?4?4?2?4?&@?1?)?)?!W? LP2      +      x?????? ? ?      ?      x?3?4?2bc 6?4?2?=... '??      ?   .   x?3?,?,??2??-M-*??2?L?MJ,J???2?,H	??qqq ?]?      ?   ?   x?M?M?@??ݧ?(!???R?lZҢ?d??X8???#?Ō??]?ޫ?:?!?LJ]??N؂ۂ\?m?YJǖNB?D??T%&???KJ؁)??0?LR1???~uU+>?N?8J???~?	???؇??Yy?a1v??^?$Yi*A=??????2G,???,???}S6??bXSk5c?_?ȸm ? g8      ?   *   x?3426153???4䲴0735162?4?2?Nc?=... ?u      ?   i   x?u???0г3jܤ?%??3???*
*?X??9
e4O???a[????vP???/????Z?M?4|??%J?)?4??%'?H???'JɃr??Ҥ>r[D??M5!      ?   ?   x???A
? ???)<AP?[??fP[?DS!?o???????+x
#?$%(??^?> &&???H9?>??)??1?#NE??>?
??R??F?T4?#???-3.#????3Ō ?z:???^9?Ƃ?????\'D?oʋ?      ?   ?   x???[N1E?oV????-l???Θ*(?<*Ķ??nO? J????'G???_???^??T)Ha/??p<$ˣ??6pFw-?CG???I^4??\8?+<;??6??vn"???b????wMJ??/???0Bu=O?$U???$M??sn?-l%Y?	??>\?]??????U??F͗?k??̭n?K9m?m?˜yV?y??????s????      ?   ?   x?3?L?LL??/.?L?/NM.?KI,??7?2?.a?K???	?.;pH??0?%a????? eyJi         M   x?3?L?(??/JL?<?9?ˈ3%31=???????|.cΒ?Ē???Լ?|.΢ԌĤ̜??rS????|?=... ?~         *   x?3?,,?,:??(=39?ˈ3???˘3??(?+F??? ?o         ?   x???;?0Dk?9??܆RDZ???K?,2
???gL??-?A??vc??:?q??0ҁq	c`??& ??;??O?????q4?e?????f?????/??{??/???????֠??T?E?T??Db????%???         P   x?M?1
?0й9EN ?y\b?Q!4??=???	???5I+??*?0??}???6??/Q?~g!çzy?h_??E?         +   x?KI,?OLJ??M?3?4?JAp?P?ƨ\T?!?!W? M
r         *   x?KI,?ONLJ?J4?4?J???Px?(<?!?W? ?0?            x?????? ? ?         +   x?KI,?O??)??K4?4?JAp?P?ƨ\T?!?!W? c:?         *   x?KI,?O.M???7?4?J???Px??F(r?<c /F??? ??         x   x???A
? е??Zݦ???¤?"<}FEF?w????i	L?"?F8?Bb?zP?H?X?Ö??q?,1³?~?:ٖ!%??C?>L?6*?34_a?V	?6??:?mw?cSH)W	?o6         )   x?KI,?/?/J?0?4?J?q??9????2Hc 'F??? N?&         ]   x?U?A? ?????s?T???A??z?x??ٝ	.?BW?h.ZD???Q?.?,?
h???9?MF???}??Ч??1????y?;?>? /Se:v      ?   ?   x?M???@???a?p????1???&R
??Vt??xp?0?????????=?ݕ+\??"y ?A?         Q   x?˻?0??o$???X??H?/?,,F??n$?H?ԭ??N?L?o??i?X(4?%=??h?0?FV????N??8 ????      -   .   x?3?4?T0?100?30?4?,?4?2?4
Z?̀?&\1z\\\ ?Ht             x?????? ? ?         `   x???=
? ??99?'($?8]D?Q??;T?Ih׏???@K?s%??C??ZL??ܻ!h????!M?+͐?p	????2?<Ԯ?}???0?
?"^J?[       .   >   x?3?LI-N.?,H???SHI?Q??+.??W0?T050?30?2ĥƈ5?D?1A?????? ?4,         /   x?3?LLN-(IL?I?2??MM?L?K?M?+IU@Hs??#qc???? -?`      	   k   x?m?A
? ????L?ӋU+??m4??"?Ya?0Z??.??D?2S@?T??̅?:M]?WS?}`Bg?\21_?1?Z?ى??J??????kwlR???Df      ?   J   x?3??MM?LN?M?+?7?T05?30?2B6
????????A?`?&??&@aC?jSdaS??????W? N ?      "   :   x?3?442615?0?L-.IL?WH.?,?L??4?4??@c=N#?=... Rw?      %   (   x?3?,H,???O??6ѐ??g??3Fᙠ?L?b???? !/?      
   =   x?3??MM?LTH??K?L????,A???????%?I9?? .#Τ??<|Z??EK? ??S      *      x?????? ? ?         ?   x?3?,(?ONM???L?+?7??NN,JL.I-?,.?LN4?A??rVe????r?'e??d??ǣ????ihdlbjfna?i?e?j??#u ?>?--??LM??9??	M??Ѭ0?} a?????? uF?      $   :   x?K?LL??/.?L?7?4?,(?ON-?7?JA?!č?ō????&8?1E6'F??? ?:)?      #   0   x?3?,(?ON-?/,?,*-J?L?7?2?4?&h?M???)W? ?u'U      &   1   x?3?,(?ON-?/I-J,H--?L?7?2?"j?U???	VQS?=... ?{)      (   ?   x?e?KN1D??)| ????X#q 6?݊yܣv?Hɍ?`?#?b8??z??ݚk??TL?6D)??C???????WB???pF?v(?ɽ^?M,?5N&??nmTN??4?N?R?d6?4?x?$~??P?K?i?µsWCR٠?ULbw?.?v?*????#????J:_??nQ#????q??????t?????ǽ??q?x"      )      x?3?4?2bc 6bS ????? '??      0   ?   x?e?KB!E?e???????Ӂ3'C??ʲ\???f????]??f???zj??Q?A)??#Zg\?????
N?}YW;<?LG70E?G???-?+???????VZ?&׉ҧ?/6??????W?r???ʴ?3??? ?xn?N?      1      x?3?4?2?4?2?4b?=... m?         ?   x?U?11??+?t\??qb,%?pB?
???>?(?ٝ?>?2!KAz?L???<O{?V???-wM?Ű?W*?C??(??m:??IN<??????Vj6-????????a?*?K??i !?6a         |   x?U??1ߗ*\????%??	?k?h?p?sgG?$?C;Cp6	??Z?+g?p????X????1?)m?8:[??e3???aZg`E??|???W?9q^??mp?D?$????R??"7?         ;   x?3426153???,?4?2D????Qx&(<S??	p??D????Qx&\1z\\\ ?	?     