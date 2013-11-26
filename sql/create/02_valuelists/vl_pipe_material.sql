/*
	qWat - QGIS Water Module

	SQL file :: vl_pipe_material table
*/


DROP TABLE IF EXISTS distribution.vl_pipe_material CASCADE;
CREATE TABLE distribution.vl_pipe_material ( id integer not null, CONSTRAINT "vl_pipe_material_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_pipe_material IS 'List of materials for pipe. All the possible combinations material/diameter are listed in this table. _displayname_fr is automatically generated by rules on insert and update. It is meant to be used in QGIS for the combo box of pipe.id_material';

/* COLUMNS*/
ALTER TABLE distribution.vl_pipe_material ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_pipe_material ADD COLUMN short_fr varchar(8);
ALTER TABLE distribution.vl_pipe_material ADD COLUMN value_fr varchar(30);
ALTER TABLE distribution.vl_pipe_material ADD COLUMN _displayname_fr varchar(18); /* created automatically, used for display only*/
ALTER TABLE distribution.vl_pipe_material ADD COLUMN short_en varchar(8);
ALTER TABLE distribution.vl_pipe_material ADD COLUMN value_en varchar(30);
ALTER TABLE distribution.vl_pipe_material ADD COLUMN _displayname_en varchar(18); /* created automatically, used for display only*/

ALTER TABLE distribution.vl_pipe_material ADD COLUMN diameter varchar(10); /* need to be varchar to specify a string for unknown or inches with a "*/
ALTER TABLE distribution.vl_pipe_material ADD COLUMN diameter_internal decimal(7,3);
ALTER TABLE distribution.vl_pipe_material ADD COLUMN diameter_external decimal(7,3);

ALTER TABLE distribution.vl_pipe_material ADD COLUMN code_sire smallint;

/* TRIGGER */
CREATE OR REPLACE FUNCTION distribution.vl_pipe_material_displayname_fr() RETURNS trigger AS 
$BODY$
	BEGIN
		 NEW._displayname_en := NEW.short_en||' '||NEW.diameter;
		 NEW._displayname_fr := NEW.short_fr||' '||NEW.diameter;
		 RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.vl_pipe_material_displayname_fr() IS 'Fcn/Trigger: updates the fancy value_fr in the material table.';

CREATE TRIGGER fancy_value_fr_trigger
	BEFORE INSERT OR UPDATE OF short_fr, diameter ON distribution.vl_pipe_material
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.vl_pipe_material_displayname_fr();
COMMENT ON TRIGGER fancy_value_fr_trigger ON distribution.vl_pipe_material IS 'Trigger: updates the fancy value_fr in the material table.';


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5001,'Inconnu','Inconnu'            ,''       , NULL   , NULL, 1 );
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5101,'AC'  ,'Acier'                 ,''       , NULL   , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5102,'AC'  ,'Acier'                 ,'100'    ,100     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5103,'AC'  ,'Acier'                 ,'120'    ,120     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5104,'AC'  ,'Acier'                 ,'125'    ,125     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5105,'AC'  ,'Acier'                 ,'150'    ,150     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5106,'AC'  ,'Acier'                 ,'175'    ,175     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5107,'AC'  ,'Acier'                 ,'180'    ,180     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5108,'AC'  ,'Acier'                 ,'200'    ,200     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5109,'AC'  ,'Acier'                 ,'250'    ,250     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5110,'AC'  ,'Acier'                 ,'300'    ,300     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5111,'AC'  ,'Acier'                 ,'400'    ,400     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5112,'AC'  ,'Acier'                 ,'50'     ,50      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5113,'AC'  ,'Acier'                 ,'500'    ,500     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5114,'AC'  ,'Acier'                 ,'60'     ,60      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5115,'AC'  ,'Acier'                 ,'600'    ,600     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5116,'AC'  ,'Acier'                 ,'65'     ,65      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5117,'AC'  ,'Acier'                 ,'70'     ,70      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5118,'AC'  ,'Acier'                 ,'75'     ,75      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5119,'AC'  ,'Acier'                 ,'80'     ,80      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5120,'AC'  ,'Acier'                 ,'800'    ,800     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5151,'ACG' ,'Acier galvanisé'       ,''       , NULL   , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5152,'ACG' ,'Acier galvanisé'       ,'0.5"'   ,16      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5153,'ACG' ,'Acier galvanisé'       ,'0.75"'  ,21.6    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5154,'ACG' ,'Acier galvanisé'       ,'1 '     ,27.2    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5155,'ACG' ,'Acier galvanisé'       ,'1"'     ,27.2    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5156,'ACG' ,'Acier galvanisé'       ,'100'    ,105.3   , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5157,'ACG' ,'Acier galvanisé'       ,'1.25"'  ,35.9    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5158,'ACG' ,'Acier galvanisé'       ,'1.5"'   ,41.8    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5159,'ACG' ,'Acier galvanisé'       ,'2"'     ,53      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5160,'ACG' ,'Acier galvanisé'       ,'2.5"'   ,68.8    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5170,'ACG' ,'Acier galvanisé'       ,'3"'     ,80.8    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5171,'ACG' ,'Acier galvanisé'       ,'4"'     ,105.3   , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5172,'ACG' ,'Acier galvanisé'       ,'80'     ,80.8    , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5201,'ACI' ,'Acier inoxydable'      ,'100'    ,100     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5202,'ACI' ,'Acier inoxydable'      ,'125'    ,125     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5203,'ACI' ,'Acier inoxydable'      ,'150'    ,150     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5204,'ACI' ,'Acier inoxydable'      ,'200'    ,200     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5205,'ACI' ,'Acier inoxydable'      ,'250'    ,250     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5251,'ACPR','Acier prestolic'       ,''       , NULL   , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5252,'ACPR','Acier prestolic'       ,'100'    ,100     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5253,'ACPR','Acier prestolic'       ,'125'    ,125     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5254,'ACPR','Acier prestolic'       ,'150'    ,150     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5255,'ACPR','Acier prestolic'       ,'200'    ,200     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5256,'ACPR','Acier prestolic'       ,'300'    ,300     , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5257,'ACPR','Acier prestolic'       ,'50'     ,50      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5258,'ACPR','Acier prestolic'       ,'60'     ,60      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5259,'ACPR','Acier prestolic'       ,'80'     ,80      , NULL, 11);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5301,'CU'  ,'Cuivre'                ,''       , NULL   , NULL, 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5302,'CU'  ,'Cuivre'                ,'1"'     ,25      ,28   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5303,'CU'  ,'Cuivre'                ,'10'     ,10      ,12   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5304,'CU'  ,'Cuivre'                ,'12'     ,10      ,12   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5305,'CU'  ,'Cuivre'                ,'1.25"'  ,32      ,35   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5306,'CU'  ,'Cuivre'                ,'15'     ,13      ,15   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5307,'CU'  ,'Cuivre'                ,'17'     ,16      ,18   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5308,'CU'  ,'Cuivre'                ,'22/19'  ,20      ,22   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5309,'CU'  ,'Cuivre'                ,'25'     ,25      ,28   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5310,'CU'  ,'Cuivre'                ,'32'     ,32      ,35   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5351,'F'   ,'Fonte'                 ,''       , NULL   , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5352,'F'   ,'Fonte'                 ,'100'    ,100     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5353,'F'   ,'Fonte'                 ,'110'    ,110     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5354,'F'   ,'Fonte'                 ,'120'    ,120     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5355,'F'   ,'Fonte'                 ,'125'    ,125     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5356,'F'   ,'Fonte'                 ,'150'    ,150     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5357,'F'   ,'Fonte'                 ,'175'    ,175     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5358,'F'   ,'Fonte'                 ,'180'    ,180     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5359,'F'   ,'Fonte'                 ,'200'    ,200     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5360,'F'   ,'Fonte'                 ,'250'    ,250     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5361,'F'   ,'Fonte'                 ,'300'    ,300     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5362,'F'   ,'Fonte'                 ,'350'    ,350     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5363,'F'   ,'Fonte'                 ,'375'    ,375     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5364,'F'   ,'Fonte'                 ,'400'    ,400     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5365,'F'   ,'Fonte'                 ,'50'     ,50      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5366,'F'   ,'Fonte'                 ,'500'    ,500     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5367,'F'   ,'Fonte'                 ,'60'     ,60      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5368,'F'   ,'Fonte'                 ,'600'    ,600     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5369,'F'   ,'Fonte'                 ,'65'     ,65      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5370,'F'   ,'Fonte'                 ,'70'     ,70      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5371,'F'   ,'Fonte'                 ,'80'     ,80      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5372,'F'   ,'Fonte'                 ,'800'    ,800     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5373,'F'   ,'Fonte'                 ,'90'     ,90      , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5401,'FAE' ,'Fonte auto-étanche'    ,'100'    ,100     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5402,'FAE' ,'Fonte auto-étanche'    ,'125'    ,125     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5403,'FAE' ,'Fonte auto-étanche'    ,'150'    ,150     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5404,'FAE' ,'Fonte auto-étanche'    ,'200'    ,200     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5405,'FAE' ,'Fonte auto-étanche'    ,'250'    ,250     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5406,'FAE' ,'Fonte auto-étanche'    ,'300'    ,300     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5407,'FAE' ,'Fonte auto-étanche'    ,'400'    ,400     , NULL, 4);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5501,'PE'  ,'Polyéthylène'          ,''       , NULL   , NULL, 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5502,'PE'  ,'Polyéthylène'          ,'100'    , NULL   , NULL, 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5503,'PE'  ,'Polyéthylène'          ,'110'    ,90      ,110  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5504,'PE'  ,'Polyéthylène'          ,'125'    ,102.2   ,125  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5505,'PE'  ,'Polyéthylène'          ,'150'    , NULL   , NULL, 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5506,'PE'  ,'Polyéthylène'          ,'160'    ,130.8   ,160  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5507,'PE'  ,'Polyéthylène'          ,'200'    ,163.6   ,200  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5508,'PE'  ,'Polyéthylène'          ,'25'     ,20.4    ,25   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5509,'PE'  ,'Polyéthylène'          ,'250'    ,204.6   ,250  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5510,'PE'  ,'Polyéthylène'          ,'32'     ,26.2    ,32   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5511,'PE'  ,'Polyéthylène'          ,'355'    ,290.4   ,355  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5512,'PE'  ,'Polyéthylène'          ,'40'     ,32.6    ,40   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5513,'PE'  ,'Polyéthylène'          ,'400'    ,327.2   ,400  , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5514,'PE'  ,'Polyéthylène'          ,'50'     ,40.8    ,50   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5515,'PE'  ,'Polyéthylène'          ,'63'     ,51.4    ,63   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5516,'PE'  ,'Polyéthylène'          ,'75'     ,61.4    ,75   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5517,'PE'  ,'Polyéthylène'          ,'90'     ,73.6    ,90   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5551,'PE80','Polyéthylène 80'       ,'50'     , NULL   , NULL, 8);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5552,'PE80','Polyéthylène 80'       ,'63'     , NULL   , NULL, 8);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5601,'PEX' ,'Polyéthylène réticulé' ,'63'     ,50      ,63   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5602,'PEX' ,'Polyéthylène réticulé' ,'90'     ,75      ,90   , 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5603,'PEX' ,'Polyéthylène réticulé' ,'160'    , NULL   , NULL, 10);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5651,'PL'  ,'Plastique'             ,''       , NULL   , NULL, 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5652,'PL'  ,'Plastique'             ,'0.2'    , NULL   , NULL, 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5653,'PL'  ,'Plastique'             ,'0.75"'  ,20.4    ,25   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5654,'PL'  ,'Plastique'             ,'1"'     ,32.6    ,40   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5655,'PL'  ,'Plastique'             ,'1.25"'  ,40.8    ,50   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5656,'PL'  ,'Plastique'             ,'1.5"'   ,51.4    ,63   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5657,'PL'  ,'Plastique'             ,'2"'     ,61.4    ,75   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5658,'PL'  ,'Plastique'             ,'20'     ,16      ,20   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5659,'PL'  ,'Plastique'             ,'25'     ,20.4    ,25   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5660,'PL'  ,'Plastique'             ,'2.5"'   ,73.6    ,90   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5661,'PL'  ,'Plastique'             ,'32'     ,26.2    ,32   , 0);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5662,'PL'  ,'Plastique'             ,'150'    , NULL   , NULL, 0);        /*SHOULD BE REMOVED */
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5701,'PVC' ,'Chlorure de polyvinyle','100'    , NULL   , NULL, 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5702,'PVC' ,'Chlorure de polyvinyle','120'    , NULL   , NULL, 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5703,'PVC' ,'Chlorure de polyvinyle','125'    , NULL   , NULL, 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5704,'PVC' ,'Chlorure de polyvinyle','140'    ,125     ,140  , 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5705,'PVC' ,'Chlorure de polyvinyle','150'    , NULL   , NULL, 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5706,'PVC' ,'Chlorure de polyvinyle','160'    ,150     ,160  , 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5707,'PVC' ,'Chlorure de polyvinyle','20'     ,15.4    ,20   , 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5708,'PVC' ,'Chlorure de polyvinyle','250'    ,225     ,250  , 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5709,'PVC' ,'Chlorure de polyvinyle','600'    , NULL   , NULL, 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5710,'PVC' ,'Chlorure de polyvinyle','75'     ,65      ,75   , 6);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5751,'TAC' ,'Amiante Ciment'        ,'100'    ,80      , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5752,'TAC' ,'Amiante Ciment'        ,'120'    ,100     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5753,'TAC' ,'Amiante Ciment'        ,'125'    ,100     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5754,'TAC' ,'Amiante Ciment'        ,'150'    ,125     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5755,'TAC' ,'Amiante Ciment'        ,'160'    ,125     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5756,'TAC' ,'Amiante Ciment'        ,'175'    ,150     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5757,'TAC' ,'Amiante Ciment'        ,'20'     , NULL   , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5758,'TAC' ,'Amiante Ciment'        ,'200'    ,175     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5759,'TAC' ,'Amiante Ciment'        ,'250'    ,200     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5760,'TAC' ,'Amiante Ciment'        ,'30'     , NULL   , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5761,'TAC' ,'Amiante Ciment'        ,'300'    ,250     , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5762,'TAC' ,'Amiante Ciment'        ,'50'     ,50      , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5763,'TAC' ,'Amiante Ciment'        ,'80'     ,60      , NULL, 2);
INSERT INTO distribution.vl_pipe_material (id,short_fr,value_fr,diameter,diameter_internal,diameter_external,code_sire) VALUES (5801,'TC'  ,'Tuyau Ciment'          ,'20'     , NULL   , NULL, 3);


