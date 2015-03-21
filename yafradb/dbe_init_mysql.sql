/* drop any old database / users first */
DROP DATABASE if exists yafra;
GRANT USAGE ON *.* TO 'yafraadmin'@'localhost';
drop user 'yafraadmin'@'localhost';
GRANT USAGE ON *.* TO 'yafraadmin'@'127.0.0.1';
drop user 'yafraadmin'@'127.0.0.1';
GRANT USAGE ON *.* TO 'yafraadmin'@'192.168.%.%';
drop user 'yafraadmin'@'192.168.%.%';
GRANT USAGE ON *.* TO 'yafraadmin'@'172.17.%.%';
drop user 'yafraadmin'@'172.17.%.%';
commit;

/* create users */
CREATE USER 'yafraadmin'@'localhost' IDENTIFIED BY  'yafra';
CREATE USER 'yafraadmin'@'127.0.0.1' IDENTIFIED BY  'yafra';
CREATE USER 'yafraadmin'@'192.168.%.%' IDENTIFIED BY  'yafra';
CREATE USER 'yafraadmin'@'172.17.%.%' IDENTIFIED BY  'yafra';
commit;

/* create database now */
/* create database yafra DEFAULT CHARACTER SET utf8; for UTF8 support */
create database yafra;
use yafra;
commit;

GRANT ALL PRIVILEGES ON yafra. * TO  'yafraadmin'@'localhost';
GRANT ALL PRIVILEGES ON yafra. * TO  'yafraadmin'@'127.0.0.1';
GRANT ALL PRIVILEGES ON yafra. * TO  'yafraadmin'@'192.168.%.%';
GRANT ALL PRIVILEGES ON yafra. * TO  'yafraadmin'@'172.17.%.%';
commit;
