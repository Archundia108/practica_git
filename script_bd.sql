DROP TABLE IF EXISTS dual_competencias
CREATE TABLE dual_competencias
(
	cve_competencia INT NOT NULL PRIMARY KEY,
	nombre_competencia VARCHAR(50) NOT NULL,
	fecha DATE NOT NULL,
	cve_carrera INT NOT NULL
)

DROP TABLE IF EXISTS dual_puestos_aprendizaje
CREATE TABLE dual_puestos_aprendizaje
(
	cve_puesto_aprendizaje INT NOT NULL,
	anio INT NOT NULL,
	cve_competencia INT NOT NULL,
	nombre_puesto_aprendizaje VARCHAR(50) NOT NULL,
	objetivo_gral TEXT NOT NULL,
	requerimientos_gral TEXT NOT NULL,
	con_teoricos TEXT NOT NULL,
	con_procedimentales TEXT NOT NULL,
	con_actitudinales TEXT NOT NULL, 
	actvd_desarrollo TEXT NOT NULL,
	fecha DATE NOT NULL,
	vigente INT NOT NULL
	PRIMARY KEY (cve_puesto_aprendizaje, anio, cve_competencia)
)

DROP TABLE IF EXISTS dual_empresas
CREATE TABLE dual_empresas
(
	cve_competencia INT NOT NULL,
	cve_empresa INT NOT NULL
	PRIMARY KEY (cve_competencia, cve_empresa)
)

DROP TABLE IF EXISTS dual_objetivos_aprendizaje
CREATE TABLE dual_objetivos_aprendizaje
(
	numero INT NOT NULL,
	objetivo TEXT NOT NULL, 
	resultado TEXT NOT NULL,
	cve_puesto_aprendizaje INT NOT NULL,
	anio INT NOT NULL
	PRIMARY KEY (numero, cve_puesto_aprendizaje, anio)
)

DROP TABLE IF EXISTS dual_convocatorias
CREATE TABLE dual_convocatorias
(
	cve_convocatoria INT NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_termino DATE NOT NULL,
	descripcion TEXT NOT NULL,
	vigente INT NOT NULL,
	fecha_notificacion DATE,
	cve_competencia INT NOT NULL
	PRIMARY KEY (cve_convocatoria, cve_competencia)
)

DROP TABLE IF EXISTS dual_alumnos
CREATE TABLE dual_alumnos
(
	cve_alumno INT NOT NULL,
	cve_periodo INT NOT NULL,
	cve_competencia INT NOT NULL,
	cve_empresa INT NOT NULL,
	horario TEXT NOT NULL,
	cve_tutor INT NOT NULL,
	cve_asesor_dual_utsjr INT NOT NULL,
	nom_inst_empresa VARCHAR (50) NOT NULL,
	ape_pat_inst_empresa VARCHAR (50) NOT NULL,
	ape_mat_inst_empresa VARCHAR (50) NOT NULL,
	tel_inst_empresa INT NOT NULL,
	correo_inst_empresa VARCHAR (50) NOT NULL,
	fecha_exa_conoc DATE,
	calif_exa_conoc INT NOT NULL,
	obser_exa_conoc TEXT NOT NULL,
	fecha_exa_psico DATE,
	calif_exa_psico INT NOT NULL,
	obser_exa_psico TEXT NOT NULL,
	cve_convocatoria INT NOT NULL,
	fecha_tutor_notif DATE,
	fecha_notif_asesor_dual DATE,
	nom_plan_rotacion VARCHAR (50) NULL
	PRIMARY KEY (cve_alumno, cve_competencia, cve_periodo)
)

DROP TABLE IF EXISTS dual_meses
CREATE TABLE dual_meses
(
	cve_competencia INT NOT NULL,
	cve_alumno INT NOT NULL,
	cve_periodo INT NOT NULL, 
	mes_1 INT NOT NULL,
	mes_2 INT NOT NULL,
	mes_3 INT NOT NULL,
	mes_4 INT NOT NULL
	PRIMARY KEY (cve_competencia, cve_alumno, cve_periodo)
)

DROP TABLE IF EXISTS dual_semanas
CREATE TABLE dual_semanas
(
	cve_competencia INT NOT NULL,
	cve_alumno INT NOT NULL,
	cve_periodo INT NOT NULL,
	semana_1 INT NOT NULL,
	semana_2 INT NOT NULL,
	semana_3 INT NOT NULL,
	semana_4 INT NOT NULL,
	semana_5 INT NOT NULL,
	semana_6 INT NOT NULL,
	semana_7 INT NOT NULL,
	semana_8 INT NOT NULL,
	semana_9 INT NOT NULL,
	semana_10 INT NOT NULL,
	semana_11 INT NOT NULL,
	semana_12 INT NOT NULL,
	semana_13 INT NOT NULL,
	semana_14 INT NOT NULL,
	semana_15 INT NOT NULL,
	semana_16 INT NOT NULL
	PRIMARY KEY (cve_competencia, cve_alumno, cve_periodo)
)

DROP TABLE IF EXISTS dual_dias
CREATE TABLE dual_dias
(
	cve_competencia INT NOT NULL,
	cve_alumno INT NOT NULL,
	cve_periodo INT NOT NULL,
	L INT NOT NULL,
	M INT NOT NULL,
	I INT NOT NULL,
	J INT NOT NULL,
	V INT NOT NULL
	PRIMARY KEY (cve_competencia, cve_alumno, cve_periodo)
)

DROP TABLE IF EXISTS dual_alumnos_puestos
CREATE TABLE dual_alumnos_puestos
(
	cve_competencia INT NOT NULL,
	cve_puesto_aprendizaje INT NOT NULL,
	cve_alumno INT NOT NULL,
	cve_periodo INT NOT NULL,
	orden INT NOT NULL
	PRIMARY KEY (cve_competencia, cve_puesto_aprendizaje, cve_alumno,cve_periodo)
)

DROP TABLE IF EXISTS dual_observaciones
CREATE TABLE dual_observaciones
(
	cve_competencia int not null,
	cve_alumno int not null,
	cve_periodo int not null,
	consecutivo int not null,
	obser_asesor_dual TEXT,
	obser_inst_empresa TEXT,
	fecha_registro DATE NOT NULL, 
	fecha_notif_empresa DATE,
	fecha_notif_alumno DATE
	PRIMARY KEY (cve_competencia,cve_alumno,cve_periodo,consecutivo)
)

DROP TABLE IF EXISTS dual_evaluaciones;
CREATE TABLE dual_evaluaciones 
(
   cve_alumno           int                            not null,
   cve_periodo          int                            not null,
   cve_competencia      int                            not null,
   cve_parcial          int                            not null,
   FECHA_EVALUACION     date                           null,
   FECHA_NOTIF          date                           null,
   SA                   float                          null,
   SE                   float                          null,
   SH                   float                          null
   PRIMARY KEY  (cve_alumno, cve_periodo, cve_competencia, cve_parcial)
)
