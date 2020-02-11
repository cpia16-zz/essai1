CREATE SCHEMA "GEO_FREE";

CREATE TABLE "GEO_FREE"."Type-Implantation" ( 
	id_implantation      serial  NOT NULL ,
	description          varchar   ,
	CONSTRAINT "Implantation_pkey" PRIMARY KEY ( id_implantation )
 );

CREATE TABLE "GEO_FREE"."Type-Mode-pose" ( 
	id_mode_pose         serial  NOT NULL ,
	pose                 varchar   ,
	CONSTRAINT "Mode_pose_pkey" PRIMARY KEY ( id_mode_pose )
 );

CREATE TABLE "GEO_FREE"."Type-couleurs-tube-fo" ( 
	id_tube_fo           serial  NOT NULL ,
	numero_tube          varchar(2)   ,
	couleur              varchar(9)   ,
	"bague_noire"        varchar(1)   ,
	code_html            varchar(7)   ,
	
	CONSTRAINT "Pk_id_tube-fo" PRIMARY KEY ( id_tube_fo )
 );

CREATE TABLE "GEO_FREE"."Type-geoloc-class" ( 
	id_geoloc_class      serial  NOT NULL ,
	"class"              varchar   ,
	description          varchar   ,

	CONSTRAINT "Geoloc-class_pkey" PRIMARY KEY ( id_geoloc_class )
 );

CREATE TABLE "GEO_FREE"."Type-local_tech" ( 
	id_local_tech        serial  NOT NULL ,
	nom                  varchar(30)   ,
	code                 varchar(20)   ,
	baie                 varchar(2)   ,
	ferme                varchar(2)   ,
	niveau               varchar(2)   ,
	"position"           varchar(2)   ,
	CONSTRAINT "Local_tech_pkey" PRIMARY KEY ( id_local_tech )
 );

CREATE TABLE "GEO_FREE"."Type-noeud" ( 
	id_type_noeud        serial  NOT NULL ,
	"type"               varchar   ,
	description          varchar   ,
	CONSTRAINT "Type-noeud_pkey" PRIMARY KEY ( id_type_noeud )
 );

CREATE TABLE "GEO_FREE"."Type-source-geoloc" ( 
	id_source_geoloc     serial  NOT NULL ,
	"source"             varchar   ,
	description          varchar   ,
	CONSTRAINT "Pk_id_source-geoloc" PRIMARY KEY ( id_source_geoloc )
 );

CREATE TABLE "GEO_FREE".artere ( 
	id_artere            serial  NOT NULL ,
	longueur             numeric(1000,0)   ,
	fk_proprio           bigint   ,
	date_maj             date   ,
	CONSTRAINT "Artere_pkey" PRIMARY KEY ( id_artere )
 );

CREATE TABLE "GEO_FREE".bpe ( 
	id_bpe               serial  NOT NULL ,
	fk_chambre           bigint   ,
	marque               varchar(30)   ,
	model                varchar(20)   ,
	capacite             varchar(3)   ,
	fk_proprio           bigint   ,
	fk_gestion           bigint   ,
	date_maj             date   ,
	CONSTRAINT bpe_pkey PRIMARY KEY ( id_bpe )
 );

CREATE TABLE "GEO_FREE".cable ( 
	
	id_cable             serial  NOT NULL ,
	geom                 geometry(LineString,27572),
	fk_fourreau          integer   ,
	fk_artere            integer   ,
	code                 varchar   ,
	diametre_exterieur   float8   ,
	techno               varchar   ,
	synbolisation        varchar   ,
	emprise              varchar   ,
	fibre_nombre         varchar(3)   ,
	tube_nombre          varchar(2)   ,
	fibre_utilise        varchar(3)   ,
	fibre_dispo          varchar(3)   ,
	ref_cable            varchar   ,
	fabricant            varchar   ,
	fk_etat              integer   ,
	date_install         date   ,
	date_dernier_incident date   ,
	commentaire_dernier_incident varchar   ,
	fk_proprio           integer   ,
	fk_gestion           integer   ,
	date_maj             date   ,
	longueur_reel        numeric(1000,0)   ,
	fk_geoloc_class      integer   ,
	fk_source_geoloc     integer   ,
	fk_user_maj          integer   ,
	CONSTRAINT pk_id_cable PRIMARY KEY ( id_cable )
 );

CREATE TABLE "GEO_FREE".etat ( 
	id_etat              serial  NOT NULL ,
	etat                 varchar   ,
	CONSTRAINT "Etats_pkey" PRIMARY KEY ( id_etat )
 );

CREATE TABLE "GEO_FREE".fourreau ( 
	id_fourreau          serial  NOT NULL ,
	fk_artere            integer   ,
	fk_etat              integer   ,
	nombre               varchar(1)   ,
	creation_date        date   ,
	aiguillage_date      date   ,
	mandrinage_date      date   ,
	fk_proprio           integer   ,
	fk_gestion           integer   ,
	date_maj             date   ,
	fk_type_conduite     integer   ,
	diametre_ext         numeric(1000,0)   ,
	diametre_int         numeric(1000,0)   ,
	fourreau_vide        varchar   ,
	fk_user_maj          integer   ,
	CONSTRAINT pk_id_fourreau PRIMARY KEY ( id_fourreau ),
	CONSTRAINT unq_fourreau_nombre UNIQUE ( nombre ) 
 );

CREATE TABLE "GEO_FREE".noeud ( 
	id_noeud             serial  NOT NULL ,
	nom                  varchar   ,
	date_creation        date   ,
	date_maj             date   ,
	fk_user_maj          integer   ,
	fk_noeud             integer   ,
	CONSTRAINT "Pk_ id_noeud" PRIMARY KEY ( id_noeud )
 );

CREATE TABLE "GEO_FREE"."Proprio-Gestion" (
	id_proprio_gestion   serial  NOT NULL , 
	nom                  varchar   ,
	premon               varchar   ,
	telephone            varchar   ,
	mail                 varchar   ,
	fonction             varchar   ,
	service              varchar   ,
	entite               varchar   ,
	CONSTRAINT "Proprio_Gestion_pkey" PRIMARY KEY ( id_proprio_gestion )
 );

CREATE TABLE "GEO_FREE".Tranchee ( 
	id_tranchee          serial  NOT NULL ,
	geom                 geometry(LineString,27572),
	fk_artere            bigint   ,
	fk_commune           bigint   ,
	longueur             numeric(1000,0)   ,
	largeur              numeric(1000,0)   ,
	remblaie             varchar(254)   ,
	charge               varchar(3)   ,
	grillage             varchar(254)   ,
	plinox               varchar(254)   ,
	convention           varchar(254)   ,
	fk_gestion           bigint   ,
	date_maj             date   ,
	CONSTRAINT tranchee_pkey PRIMARY KEY ( id_tranchee )
 );


CREATE TABLE "GEO_FREE"."Type-chambre" ( 
	id_type_chambre      serial  NOT NULL ,
	"type"               varchar(4)   ,
	description          varchar   ,
	CONSTRAINT "Pk_id_type-chambre" PRIMARY KEY ( id_type_chambre )
 );

CREATE TABLE "GEO_FREE"."Type-conduite" ( 
	id_type_conduite     serial  NOT NULL ,
	"type"               varchar   ,
	description          varchar   ,
	CONSTRAINT "Pk_id_type-conduite" PRIMARY KEY ( id_type_conduite )
 );

CREATE TABLE "GEO_FREE"."Type-construction" ( 
	id_type_construction serial  NOT NULL ,
	construction         varchar   ,
	description          varchar   ,
	CONSTRAINT "Pk_id_type-construction" PRIMARY KEY ( id_type_construction )
 );

CREATE TABLE "GEO_FREE"."Type-tranchee" ( 
	id_type_tranchee     serial  NOT NULL ,
	description          varchar   ,
	CONSTRAINT "Type-tranchee_pkey" PRIMARY KEY ( id_type_tranchee )
 );

CREATE TABLE "GEO_FREE"."Type-usage" ( 
	id_usage             serial  NOT NULL ,
	"usage"              varchar   ,
	description          varchar   ,
	CONSTRAINT "pk_type-usage_id_usage" PRIMARY KEY ( id_usage )
 );

CREATE TABLE "GEO_FREE"."user" ( 
	id_user              serial  NOT NULL ,
	login                varchar(10)   ,
	passwd               varchar(10)   ,
	nom                  varchar(15)   ,
	premon               varchar(15)   ,
	mail                 varchar(20)   ,
	gsm                  varchar(8)   ,
	telephone            varchar(8)   ,
	fonction             varchar(10)   ,
	service              varchar(10)   ,
	entite               varchar(15)   ,
	CONSTRAINT "Pk_id_user" PRIMARY KEY ( id_user )
 );

CREATE TABLE "GEO_FREE"."Chambres" ( 
	id_chambres          serial  NOT NULL ,
	geom                 geometry(Point,27572),
	fk_implant           integer   ,
	"fk_type_ch"         integer   ,
	fk_noeud             integer   ,
	fk_usage             integer   ,
	photo_vue            varchar(80)   ,
	photo_vue_1          varchar(80)   ,
	CONSTRAINT "Chambres_pkey" PRIMARY KEY ( id_chambres ),
	CONSTRAINT unq_chambres_fk_usage UNIQUE ( fk_usage ) 
 );


CREATE TABLE "GEO_FREE".soudure ( 
	id_soudure           serial  NOT NULL ,
	fk_bpe               integer   ,
	fk_chambre           integer   ,
	cassette             varchar(3)   ,
	"fk_couleur_fo"      integer   ,
	"fk_tube_fo"         integer   ,
	date_maj             date   ,
	fk_cable_in          integer   ,
	fk_cable_out         integer   ,
	fk_user_maj          integer   ,
	CONSTRAINT "Pk_id_soudure" PRIMARY KEY ( id_soudure )
 );


INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 1, 'ACCOTEMENT' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 2, 'CHAUSSEE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 3, 'TROTTOIR' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 4, 'TERRE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 5, 'EMPIERRE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 6, 'PONT' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 7, 'PASSAGE SNCF' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 8, 'CANIVEAU TECHNIQUE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 9, 'PAVES' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 10, 'AQUATIQUE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 11, 'BETON DESACTIVE' ); 
INSERT INTO "GEO_FREE"."Type-Implantation"( id_implantation, description ) VALUES ( 12, 'NON COMMUNIQUE' ); 

INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 1, 'Aérien Orange' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 2, 'Aérien EDF' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 3, 'Façade' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 4, 'Immeuble' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 5, 'Pleine terre' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 6, 'Caniveau' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 7, 'Galerie' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 8, 'Conduite' ); 
INSERT INTO "GEO_FREE"."Type-Mode-pose"( id_mode_pose, pose ) VALUES ( 9, 'Égout' ); 

INSERT INTO "GEO_FREE"."Type-geoloc-class"( id_geoloc_class, class, description ) VALUES ( 1, 'A', 'Classe de précision A' ); 
INSERT INTO "GEO_FREE"."Type-geoloc-class"( id_geoloc_class, class, description ) VALUES ( 2, 'B', 'Classe de précision B' ); 
INSERT INTO "GEO_FREE"."Type-geoloc-class"( id_geoloc_class, class, description ) VALUES ( 3, 'B', 'Classe de précision C' ); 

INSERT INTO "GEO_FREE"."Type-noeud"( id_type_noeud, type, description ) VALUES ( 1, 'chambre', 'chambre' ); 
INSERT INTO "GEO_FREE"."Type-noeud"( id_type_noeud, type, description ) VALUES ( 2, 'local-tech', 'local' ); 
INSERT INTO "GEO_FREE"."Type-noeud"( id_type_noeud, type, description ) VALUES ( 3, 'virutel', 'changement d''Insee' ); 

