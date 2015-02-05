DROP TABLE yafra.YafraUserRole
;

DROP TABLE yafra.YafraRole
;

DROP TABLE yafra.PersonLog
;

DROP TABLE yafra.YafraAudit
;

DROP TABLE yafra.YafraBusinessRole
;

DROP TABLE yafra.Person
;

DROP TABLE yafra.YafraUserDevice
;

DROP TABLE yafra.YafraUser
;

CREATE TABLE yafra.YafraUser (email VARCHAR (200), name VARCHAR (1000) NOT NULL, phone VARCHAR (200), picturelink VARCHAR (4000), pkYafraUser INTEGER NOT NULL, userid VARCHAR (500) NOT NULL, PRIMARY KEY (pkYafraUser))
;

CREATE TABLE yafra.YafraUserDevice (YUser INTEGER NOT NULL, deviceAuthDate DATE, deviceAuthToken VARCHAR (500), deviceId VARCHAR (300) NOT NULL, deviceOs VARCHAR (100), devicePushToken VARCHAR (500), deviceRegistrationDate DATE, pkYafraUserDevice INTEGER NOT NULL, PRIMARY KEY (pkYafraUserDevice))
;

CREATE TABLE yafra.Person (address VARCHAR (4000), country VARCHAR (1000), email VARCHAR (200), firstname VARCHAR (1000) NOT NULL, googleId VARCHAR (4000), id INTEGER NOT NULL, name VARCHAR (1000) NOT NULL, pkPerson INTEGER NOT NULL, type VARCHAR (100) NOT NULL, PRIMARY KEY (pkPerson))
;

CREATE TABLE yafra.YafraBusinessRole (description VARCHAR (4000), flag BOOLEAN, name VARCHAR (1000) NOT NULL, pkYafraBusinessRole INTEGER NOT NULL, PRIMARY KEY (pkYafraBusinessRole))
;

CREATE TABLE yafra.YafraAudit (auditobject VARCHAR (1000), audittext VARCHAR (4000) NOT NULL, fkUser INTEGER NOT NULL, pkAudit INTEGER NOT NULL, timestamp DATE NOT NULL, PRIMARY KEY (pkAudit))
;

CREATE TABLE yafra.PersonLog (eventAudit VARCHAR (4000), eventAuditReviewer VARCHAR (1000), eventCreator VARCHAR (1000) NOT NULL, eventDate DATE NOT NULL, eventDescription VARCHAR (4000) NOT NULL, fkPersonId INTEGER NOT NULL, pkPersonLog INTEGER NOT NULL, PRIMARY KEY (pkPersonLog))
;

CREATE TABLE yafra.YafraRole (description VARCHAR (4000), fkBusinessRole INTEGER NOT NULL, name VARCHAR (1000) NOT NULL, pkYafraRole INTEGER NOT NULL, rights VARCHAR (1000), PRIMARY KEY (pkYafraRole))
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

DROP TABLE AUTO_PK_SUPPORT
;

CREATE TABLE AUTO_PK_SUPPORT (  TABLE_NAME CHAR(100) NOT NULL,  NEXT_ID BIGINT NOT NULL,  PRIMARY KEY(TABLE_NAME))
;

DELETE FROM AUTO_PK_SUPPORT WHERE TABLE_NAME IN ('Person', 'PersonLog', 'YafraAudit', 'YafraBusinessRole', 'YafraRole', 'YafraUser', 'YafraUserDevice', 'YafraUserRole')
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('Person', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('PersonLog', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraAudit', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraBusinessRole', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraRole', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUser', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUserDevice', 200)
;

INSERT INTO AUTO_PK_SUPPORT (TABLE_NAME, NEXT_ID) VALUES ('YafraUserRole', 200)
;

