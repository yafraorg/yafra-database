DROP TABLE yafra.YafraUserRole CASCADE CONSTRAINTS
;

DROP TABLE yafra.YafraRole CASCADE CONSTRAINTS
;

DROP TABLE yafra.PersonLog CASCADE CONSTRAINTS
;

DROP TABLE yafra.YafraAudit CASCADE CONSTRAINTS
;

DROP TABLE yafra.YafraBusinessRole CASCADE CONSTRAINTS
;

DROP TABLE yafra.Person CASCADE CONSTRAINTS
;

DROP TABLE yafra.YafraUserDevice CASCADE CONSTRAINTS
;

DROP TABLE yafra.YafraUser CASCADE CONSTRAINTS
;

CREATE TABLE yafra.YafraUser (email VARCHAR(200) NULL, name VARCHAR(1000) NOT NULL, phone VARCHAR(200) NULL, picturelink VARCHAR(4000) NULL, pkYafraUser INTEGER NOT NULL, userid VARCHAR(500) NOT NULL, PRIMARY KEY (pkYafraUser))
;

CREATE TABLE yafra.YafraUserDevice (YUser INTEGER NOT NULL, deviceAuthDate DATE NULL, deviceAuthToken VARCHAR(500) NULL, deviceId VARCHAR(300) NOT NULL, deviceOs VARCHAR(100) NULL, devicePushToken VARCHAR(500) NULL, deviceRegistrationDate DATE NULL, pkYafraUserDevice INTEGER NOT NULL, PRIMARY KEY (pkYafraUserDevice))
;

CREATE TABLE yafra.Person (address VARCHAR(4000) NULL, country VARCHAR(1000) NULL, email VARCHAR(200) NULL, firstname VARCHAR(1000) NOT NULL, googleId VARCHAR(4000) NULL, id INTEGER NOT NULL, name VARCHAR(1000) NOT NULL, pkPerson INTEGER NOT NULL, type VARCHAR(100) NOT NULL, PRIMARY KEY (pkPerson))
;

CREATE TABLE yafra.YafraBusinessRole (description VARCHAR(4000) NULL, flag INTEGER NULL, name VARCHAR(1000) NOT NULL, pkYafraBusinessRole INTEGER NOT NULL, PRIMARY KEY (pkYafraBusinessRole))
;

CREATE TABLE yafra.YafraAudit (auditobject VARCHAR(1000) NULL, audittext VARCHAR(4000) NOT NULL, fkUser INTEGER NOT NULL, pkAudit INTEGER NOT NULL, timestamp DATE NOT NULL, PRIMARY KEY (pkAudit))
;

CREATE TABLE yafra.PersonLog (eventAudit VARCHAR(4000) NULL, eventAuditReviewer VARCHAR(1000) NULL, eventCreator VARCHAR(1000) NOT NULL, eventDate DATE NOT NULL, eventDescription VARCHAR(4000) NOT NULL, fkPersonId INTEGER NOT NULL, pkPersonLog INTEGER NOT NULL, PRIMARY KEY (pkPersonLog))
;

CREATE TABLE yafra.YafraRole (description VARCHAR(4000) NULL, fkBusinessRole INTEGER NOT NULL, name VARCHAR(1000) NOT NULL, pkYafraRole INTEGER NOT NULL, rights VARCHAR(1000) NULL, PRIMARY KEY (pkYafraRole))
;

CREATE TABLE yafra.YafraUserRole (YRole INTEGER NOT NULL, YUser INTEGER NOT NULL, pkYafraUserRole INTEGER NOT NULL, PRIMARY KEY (pkYafraUserRole))
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

CREATE SEQUENCE yafra.pk_person START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_personlog START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafraaudit START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafrabusinessrole START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafrarole START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafrauser START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafrauserdevice START WITH 200 INCREMENT BY 20
;

CREATE SEQUENCE yafra.pk_yafrauserrole START WITH 200 INCREMENT BY 20
;

