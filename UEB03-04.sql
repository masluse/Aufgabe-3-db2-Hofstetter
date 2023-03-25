--------------------------------------------------------------------------
-- Set autocommit off
--------------------------------------------------------------------------
UPDATE COMMAND OPTIONS USING C OFF;

--------------------------------------------------------------------------
-- Set Schema UEB03D, Set 
--   - setzt Default-Schema, falls in Objekt-Referent nicht angegeben
--------------------------------------------------------------------------
SET SCHEMA UEB03D;

--------------------------------------------------------------------------
-- Stop execution on command error OFF
--------------------------------------------------------------------------
UPDATE COMMAND OPTIONS USING S OFF;

-- Ganz Oben Hinzugefügt
CREATE TABLESPACE STBDPOSTFILESTREET
  PAGESIZE 4096
  MANAGED BY AUTOMATIC STORAGE
;

--------------------------------------------------------------------------
-- DROP objects in schema UEB03D
--------------------------------------------------------------------------
DROP TABLE "ARTIKEL" ;
DROP TABLE "ART_SW" ;
DROP TABLE "ART_AUT" ;
DROP TABLE "AUTOR" ;
DROP TABLE "BUCH_AUT" ;
DROP TABLE "BUCH_SW" ;
DROP TABLE "BUCHTITEL" ;
DROP TABLE "DISS_AUT" ;
DROP TABLE "DISS_SW" ;
DROP TABLE "DISSERTATION" ;
DROP TABLE "INSTITUTION" ;
DROP TABLE "REPORT" ;
DROP TABLE "REPORT_AUT" ;
DROP TABLE "REPORT_SW" ;
DROP TABLE "SCHLAGWORT" ;
DROP TABLE "VERLAG" ;
 
--------------------------------------------------------------------------
-- Stop execution on command error ON
--------------------------------------------------------------------------
UPDATE COMMAND OPTIONS USING S ON;

--------------------------------------------------------------------------
-- CREATE tables in schema UEB03D
--------------------------------------------------------------------------

CREATE TABLE  "ARTIKEL"  
(
        "ARTIKELID"        INTEGER NOT NULL ,
	 "TITEL"            VARCHAR(255) ,
        "JAHR"             SMALLINT ,
        "AUSTITEL"         VARCHAR(255) ,
        "SEITE_VON"        SMALLINT ,
        "SEITE_BIS"        SMALLINT ,
        "BUCHID"           INTEGER ,
        "URL"              VARCHAR(200) ,
        "CR"               VARCHAR(80) ,
        "BEMERKUNG"        VARCHAR(100) 
)
IN "STBDPOSTFILESTREET" ;

CREATE TABLE  "ART_SW"  
(
       "ARTIKELID"         INTEGER NOT NULL ,
       "SWID"              INTEGER NOT NULL 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "ART_AUT"  
(
       "ARTIKELID"         INTEGER NOT NULL ,
       "AUTORID"           INTEGER NOT NULL ,
       "ROLLE"             VARCHAR(1) ,
       "RANG"              SMALLINT 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "AUTOR"  
(
       "AUTORID"           INTEGER NOT NULL ,
       "NAME"              VARCHAR(30) ,
       "ZUSATZ"            VARCHAR(10) ,
       "INITIALEN"         VARCHAR(6) ,
       "VORNAMEN"          VARCHAR(30) ,
       "INSTITUTION"       VARCHAR(50) ,
       "URL"               VARCHAR(200) ,
       "BEMERKUNG"         VARCHAR(10000) ,
       "PSEUDONYM"         INTEGER 
)
IN "STBDPOSTFILESTREET" ; 
 
CREATE TABLE  "BUCH_AUT"  
( 
       "BUCHID"            INTEGER NOT NULL ,
       "AUTORID"           INTEGER NOT NULL ,
       "ROLLE"             VARCHAR(1) ,
       "RANG"              SMALLINT 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "BUCH_SW"  
(
        "BUCHID"           INTEGER NOT NULL ,
        "SWID"             INTEGER NOT NULL 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "BUCHTITEL"  
(
        "BUCHID"           INTEGER NOT NULL ,
        "GESAMTID"         INTEGER ,
        "BANDNR"           SMALLINT ,
        "HSTITEL"          VARCHAR(255) ,
        "ESTITEL"          VARCHAR(100) ,
        "ISBN"             VARCHAR(15) ,
        "ISBN2"            VARCHAR(15)  ,
        "AUFLAGE"          VARCHAR(70) ,
        "JAHR"             SMALLINT ,
        "MEDIUM"           VARCHAR(20) ,
        "UMFANG"           VARCHAR(50) ,
        "PREIS"            VARCHAR(20) ,
        "BEZUGINFO"        VARCHAR(30) ,
        "VERF_IN_VORLFORM" VARCHAR(130) ,
        "REIHE1"           VARCHAR(150) ,
        "REIHE2"           VARCHAR(150) ,
        "KSCHAFT1"         VARCHAR(100) ,
        "KSCHAFT2"         VARCHAR(100) ,
        "HSV"              VARCHAR(50) ,
        "SIGNATUR"         VARCHAR(30) ,
        "ZUGANGSNR"        VARCHAR(30) ,
        "BESTAND"          VARCHAR(50) ,
        "WEITEXEMP"        VARCHAR(30) ,
        "ERFDATUM"         VARCHAR(17) ,
        "AENDATUM"         VARCHAR(17) ,
        "VERLAGSID"        INTEGER ,
        "URL"              VARCHAR(200) ,
        "CR"               VARCHAR(80) ,
        "BEMERKUNG"        VARCHAR(100) ,
        "BAENDE"           SMALLINT 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "DISS_AUT"  
(
        "DISSID"           INTEGER NOT NULL ,
        "AUTORID"          INTEGER NOT NULL ,
        "ROLLE"            VARCHAR(1) ,
        "RANG"             SMALLINT 
)
IN "STBDPOSTFILESTREET" ;
  
CREATE TABLE  "DISS_SW"  
(
        "DISSID"           INTEGER NOT NULL ,
        "SWID"             INTEGER NOT NULL 
)
IN "STBDPOSTFILESTREET" ;

CREATE TABLE  "DISSERTATION"  
(
       "DISSID"            INTEGER NOT NULL ,
       "TITEL"             VARCHAR(255) ,
       "INSTID"            INTEGER ,
       "ORT"               VARCHAR(80) ,
       "JAHR"              SMALLINT ,
       "ISBN"              VARCHAR(15) ,
       "TYP"               VARCHAR(1) ,
       "UMFANG"            VARCHAR(50) ,
       "SIGNATUR"          VARCHAR(30) ,
       "ZUGANGSNR"         VARCHAR(50) ,
       "BESTAND"           VARCHAR(30) ,
       "URL"               VARCHAR(200) ,
       "CR"                VARCHAR(80) ,
       "BEMERKUNG"         VARCHAR(100) 
)
IN "STBDPOSTFILESTREET" ;

CREATE TABLE  "INSTITUTION"  
(
       "INSTID"            INTEGER NOT NULL ,
       "NAME"              VARCHAR(80) ,
       "ORT"               VARCHAR(80) ,
       "ADRESSE"           VARCHAR(80) ,
       "TEL"               VARCHAR(20) ,
       "URL"               VARCHAR(200) ,
       "BEMERKUNG"         VARCHAR(100) ,
       "FAX"               VARCHAR(20) 
)
IN "STBDPOSTFILESTREET" ;

CREATE TABLE  "REPORT"  
(
       "REPORTID"          INTEGER NOT NULL ,
       "TITEL" 			   VARCHAR(255) ,
       "INSTID" 		   INTEGER ,
       "JAHR" 			   SMALLINT ,
       "LFDNR" 			   SMALLINT ,
       "URL" 			   VARCHAR(200) ,
       "CR" 			   VARCHAR(80) ,
       "UMFANG" 	 	   VARCHAR(50) ,
       "BEMERKUNG"         VARCHAR(100) ,
       "REIHE" 			   VARCHAR(150) ,
       "SIGNATUR"          VARCHAR(30) 
)
IN "STBDPOSTFILESTREET" ;
 
 CREATE TABLE  "REPORT_AUT"  
 (
        "REPORTID"         INTEGER NOT NULL ,
        "AUTORID"          INTEGER NOT NULL ,
        "RANG"             SMALLINT 
)
IN "STBDPOSTFILESTREET" ;

CREATE TABLE  "SCHLAGWORT"  
(
       "SWID"              INTEGER NOT NULL ,
       "SCHLAGWORT"        VARCHAR(50) 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "REPORT_SW"  
(
       "REPORTID"          INTEGER NOT NULL ,
       "SWID"              INTEGER NOT NULL 
)
IN "STBDPOSTFILESTREET" ;
 
CREATE TABLE  "VERLAG"  
(
       "VERLAGSID"         INTEGER NOT NULL ,
       "NAME"              VARCHAR(80) ,
       "ORT"               VARCHAR(80) ,
       "ISBNKZ"            VARCHAR(10) ,
       "ADRESSE"           VARCHAR (80) ,
       "TEL"               VARCHAR(20) ,
       "URL"               VARCHAR(200) ,
       "BEMERKUNG"         VARCHAR(100) ,
       "FAX"               VARCHAR(20) 
)
IN "STBDPOSTFILESTREET" ;

--------------------------------------------------------------------------
-- Add constraint for primary keys
--------------------------------------------------------------------------
ALTER TABLE  "ARTIKEL"      ADD CONSTRAINT "PK_ARTIKEL"      PRIMARY KEY ("ARTIKELID");
ALTER TABLE  "ART_SW"       ADD CONSTRAINT "PK_ART_SW"       PRIMARY KEY ("ARTIKELID", "SWID");
ALTER TABLE  "ART_AUT"      ADD CONSTRAINT "PK_ART_AUT"      PRIMARY KEY ("ARTIKELID", "AUTORID");
ALTER TABLE  "AUTOR"        ADD CONSTRAINT "PK_AUTOR"        PRIMARY KEY ("AUTORID");
ALTER TABLE  "BUCH_AUT"     ADD CONSTRAINT "PK_BUCH_AUT"     PRIMARY KEY ("BUCHID", "AUTORID");
ALTER TABLE  "BUCH_SW"      ADD CONSTRAINT "PK_BUCH_SW"      PRIMARY KEY ("BUCHID", "SWID");
ALTER TABLE  "BUCHTITEL"    ADD CONSTRAINT "PK_BUCHTITEL"    PRIMARY KEY ("BUCHID");
ALTER TABLE  "DISS_AUT"     ADD CONSTRAINT "PK_DISS_AUT"     PRIMARY KEY ("DISSID", "AUTORID");
ALTER TABLE  "DISS_SW"      ADD CONSTRAINT "PK_DISS_SW"      PRIMARY KEY ("DISSID", "SWID");
ALTER TABLE  "DISSERTATION" ADD CONSTRAINT "PK_DISSERTATION" PRIMARY KEY ("DISSID");
ALTER TABLE  "INSTITUTION"  ADD CONSTRAINT "PK_INSTITUTION"  PRIMARY KEY ("INSTID");
ALTER TABLE  "REPORT"       ADD CONSTRAINT "PK_REPORT"       PRIMARY KEY ("REPORTID");
ALTER TABLE  "REPORT_AUT"   ADD CONSTRAINT "PK_REPORT_AUT"   PRIMARY KEY ("REPORTID", "AUTORID");
ALTER TABLE  "REPORT_SW"    ADD CONSTRAINT "PK_REPORT_SW"    PRIMARY KEY ("REPORTID", "SWID");
ALTER TABLE  "SCHLAGWORT"   ADD CONSTRAINT "PK_SCHLAGWORT"   PRIMARY KEY ("SWID");
ALTER TABLE  "VERLAG"       ADD CONSTRAINT "PK_VERLAG"       PRIMARY KEY ("VERLAGSID");
 
--------------------------------------------------------------------------
-- Add additional indexes
--------------------------------------------------------------------------
CREATE INDEX  "I_ARTIKEL_BUCHID" ON  "ARTIKEL"  ("BUCHID" ASC) ALLOW REVERSE SCANS;

CREATE INDEX  "I_AUTOREN_NAME" ON  "AUTOR"  ("NAME" ASC,  "VORNAMEN" ASC) 
       ALLOW REVERSE SCANS;


--------------------------------------------------------------------------
-- Commit work
--------------------------------------------------------------------------
COMMIT WORK;


ECHO ******************** END OF SCRIPT ********************; 


