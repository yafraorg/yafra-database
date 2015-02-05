DROP TABLE yafra.YafraUserRole CASCADE
;

DROP TABLE yafra.YafraRole CASCADE
;

DROP TABLE yafra.PersonLog CASCADE
;

DROP TABLE yafra.YafraAudit CASCADE
;

DROP TABLE yafra.YafraBusinessRole CASCADE
;

DROP TABLE yafra.Person CASCADE
;

DROP TABLE yafra.YafraUserDevice CASCADE
;

DROP TABLE yafra.YafraUser CASCADE
;

CREATE TABLE yafra.YafraUser (email varchar(200) NULL, name varchar(1000) NOT NULL, phone varchar(200) NULL, picturelink varchar(4000) NULL, pkYafraUser integer NOT NULL, userid varchar(500) NOT NULL, PRIMARY KEY (pkYafraUser))
;

CREATE TABLE yafra.YafraUserDevice (YUser integer NOT NULL, deviceAuthDate date NULL, deviceAuthToken varchar(500) NULL, deviceId varchar(300) NOT NULL, deviceOs varchar(100) NULL, devicePushToken varchar(500) NULL, deviceRegistrationDate date NULL, pkYafraUserDevice integer NOT NULL, PRIMARY KEY (pkYafraUserDevice))
;

CREATE TABLE yafra.Person (address varchar(4000) NULL, country varchar(1000) NULL, email varchar(200) NULL, firstname varchar(1000) NOT NULL, googleId varchar(4000) NULL, id integer NOT NULL, name varchar(1000) NOT NULL, pkPerson integer NOT NULL, type varchar(100) NOT NULL, PRIMARY KEY (pkPerson))
;

CREATE TABLE yafra.YafraBusinessRole (description varchar(4000) NULL, flag boolean NULL, name varchar(1000) NOT NULL, pkYafraBusinessRole integer NOT NULL, PRIMARY KEY (pkYafraBusinessRole))
;

CREATE TABLE yafra.YafraAudit (auditobject varchar(1000) NULL, audittext varchar(4000) NOT NULL, fkUser integer NOT NULL, pkAudit integer NOT NULL, timestamp date NOT NULL, PRIMARY KEY (pkAudit))
;

CREATE TABLE yafra.PersonLog (eventAudit varchar(4000) NULL, eventAuditReviewer varchar(1000) NULL, eventCreator varchar(1000) NOT NULL, eventDate date NOT NULL, eventDescription varchar(4000) NOT NULL, fkPersonId integer NOT NULL, pkPersonLog integer NOT NULL, PRIMARY KEY (pkPersonLog))
;

CREATE TABLE yafra.YafraRole (description varchar(4000) NULL, fkBusinessRole integer NOT NULL, name varchar(1000) NOT NULL, pkYafraRole integer NOT NULL, rights varchar(1000) NULL, PRIMARY KEY (pkYafraRole))
;

CREATE TABLE yafra.YafraUserRole (YRole integer NOT NULL, YUser integer NOT NULL, pkYafraUserRole integer NOT NULL, PRIMARY KEY (pkYafraUserRole))
;

ALTER TABLE yafra.YafraUserDevice ADD FOREIGN KEY (YUser) REFERENCES yafra.YafraUser (pkYafraUser)
;

ALTER TABLE yafra.YafraAudit ADD FOREIGN KEY (fkUser) REFERENCES yafra.YafraUser (pkYafraUser)
;

ALTER TABLE yafra.PersonLog ADD FOREIGN KEY (fkPersonId) REFERENCES yafra.Person (pkPerson)
;

ALTER TABLE yafra.YafraRole ADD FOREIGN KEY (fkBusinessRole) REFERENCES yafra.YafraBusinessRole (pkYafraBusinessRole)
;

ALTER TABLE yafra.YafraUserRole ADD FOREIGN KEY (YRole) REFERENCES yafra.YafraBusinessRole (pkYafraBusinessRole)
;

ALTER TABLE yafra.YafraUserRole ADD FOREIGN KEY (YUser) REFERENCES yafra.YafraUser (pkYafraUser)
;

DROP SEQUENCE yafra.pk_person
;

DROP SEQUENCE yafra.pk_personlog
;

DROP SEQUENCE yafra.pk_yafraaudit
;

DROP SEQUENCE yafra.pk_yafrabusinessrole
;

DROP SEQUENCE yafra.pk_yafrarole
;

DROP SEQUENCE yafra.pk_yafrauser
;

DROP SEQUENCE yafra.pk_yafrauserdevice
;

DROP SEQUENCE yafra.pk_yafrauserrole
;

CREATE SEQUENCE yafra.pk_person INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_personlog INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafraaudit INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafrabusinessrole INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafrarole INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafrauser INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafrauserdevice INCREMENT 20 START 200
;

CREATE SEQUENCE yafra.pk_yafrauserrole INCREMENT 20 START 200
;

