DROP TABLE yafra.YafraUserRole
go

DROP TABLE yafra.YafraRole
go

DROP TABLE yafra.PersonLog
go

DROP TABLE yafra.YafraAudit
go

DROP TABLE yafra.YafraBusinessRole
go

DROP TABLE yafra.Person
go

DROP TABLE yafra.YafraUserDevice
go

DROP TABLE yafra.YafraUser
go

CREATE TABLE yafra.YafraUser (email varchar(200) NULL, name varchar(1000) NOT NULL, phone varchar(200) NULL, picturelink varchar(4000) NULL, pkYafraUser int NOT NULL, userid varchar(500) NOT NULL, PRIMARY KEY (pkYafraUser))
go

CREATE TABLE yafra.YafraUserDevice (YUser int NOT NULL, deviceAuthDate datetime NULL, deviceAuthToken varchar(500) NULL, deviceId varchar(300) NOT NULL, deviceOs varchar(100) NULL, devicePushToken varchar(500) NULL, deviceRegistrationDate datetime NULL, pkYafraUserDevice int NOT NULL, PRIMARY KEY (pkYafraUserDevice))
go

CREATE TABLE yafra.Person (address varchar(4000) NULL, country varchar(1000) NULL, email varchar(200) NULL, firstname varchar(1000) NOT NULL, googleId varchar(4000) NULL, id int NOT NULL, name varchar(1000) NOT NULL, pkPerson int NOT NULL, type varchar(100) NOT NULL, PRIMARY KEY (pkPerson))
go

CREATE TABLE yafra.YafraBusinessRole (description varchar(4000) NULL, flag bit NULL, name varchar(1000) NOT NULL, pkYafraBusinessRole int NOT NULL, PRIMARY KEY (pkYafraBusinessRole))
go

CREATE TABLE yafra.YafraAudit (auditobject varchar(1000) NULL, audittext varchar(4000) NOT NULL, fkUser int NOT NULL, pkAudit int NOT NULL, timestamp datetime NOT NULL, PRIMARY KEY (pkAudit))
go

CREATE TABLE yafra.PersonLog (eventAudit varchar(4000) NULL, eventAuditReviewer varchar(1000) NULL, eventCreator varchar(1000) NOT NULL, eventDate datetime NOT NULL, eventDescription varchar(4000) NOT NULL, fkPersonId int NOT NULL, pkPersonLog int NOT NULL, PRIMARY KEY (pkPersonLog))
go

CREATE TABLE yafra.YafraRole (description varchar(4000) NULL, fkBusinessRole int NOT NULL, name varchar(1000) NOT NULL, pkYafraRole int NOT NULL, rights varchar(1000) NULL, PRIMARY KEY (pkYafraRole))
go

CREATE TABLE yafra.YafraUserRole (YRole int NOT NULL, YUser int NOT NULL, pkYafraUserRole int NOT NULL, PRIMARY KEY (pkYafraUserRole))
go

ALTER TABLE yafra.YafraUserDevice ADD FOREIGN KEY (YUser) REFERENCES yafra.YafraUser (pkYafraUser)
go

ALTER TABLE yafra.YafraAudit ADD FOREIGN KEY (fkUser) REFERENCES yafra.YafraUser (pkYafraUser)
go

ALTER TABLE yafra.PersonLog ADD FOREIGN KEY (fkPersonId) REFERENCES yafra.Person (pkPerson)
go

ALTER TABLE yafra.YafraRole ADD FOREIGN KEY (fkBusinessRole) REFERENCES yafra.YafraBusinessRole (pkYafraBusinessRole)
go

ALTER TABLE yafra.YafraUserRole ADD FOREIGN KEY (YRole) REFERENCES yafra.YafraBusinessRole (pkYafraBusinessRole)
go

ALTER TABLE yafra.YafraUserRole ADD FOREIGN KEY (YUser) REFERENCES yafra.YafraUser (pkYafraUser)
go

if exists (SELECT * FROM sysobjects WHERE name = 'auto_pk_for_table') BEGIN DROP PROCEDURE auto_pk_for_table END
go

if exists (SELECT * FROM sysobjects WHERE name = 'AUTO_PK_SUPPORT') BEGIN  DROP TABLE AUTO_PK_SUPPORT END
go

CREATE TABLE AUTO_PK_SUPPORT (  TABLE_NAME CHAR(100) NOT NULL,  NEXT_ID DECIMAL(19,0) NOT NULL,  PRIMARY KEY(TABLE_NAME))
go

DELETE FROM AUTO_PK_SUPPORT WHERE TABLE_NAME IN ('Person', 'PersonLog', 'YafraAudit', 'YafraBusinessRole', 'YafraRole', 'YafraUser', 'YafraUserDevice', 'YafraUserRole')
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('Person', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('PersonLog', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraAudit', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraBusinessRole', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraRole', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUser', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUserDevice', 200)
go

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUserRole', 200)
go

if exists (SELECT * FROM sysobjects WHERE name = 'auto_pk_for_table') BEGIN DROP PROCEDURE auto_pk_for_table END
go

 CREATE PROCEDURE auto_pk_for_table @tname VARCHAR(32), @pkbatchsize INT AS BEGIN BEGIN TRANSACTION UPDATE AUTO_PK_SUPPORT set NEXT_ID = NEXT_ID + @pkbatchsize WHERE TABLE_NAME = @tname SELECT NEXT_ID FROM AUTO_PK_SUPPORT WHERE TABLE_NAME = @tname COMMIT END
go

