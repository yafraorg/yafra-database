# travelDB ABSTRACT SQL scripts


These scripts are in an abstract version in a SQL92 format.
Most probably you have to convert those scripts for Oracle, SQL Server, MySQL.

These scripts are the MASTER scripts and you should make modifications
only here and then reconvert every target again. All files are under
scm control, so check out and in !

The out_* files are for the AKTIONEN/OUTPUTS of the old classic software.
They make modifications in the AKTIONSTEXTE tabel.

The def_* files are for global initialization of the database tables.

The dbe_* are the CORE files to generate a travelDB database.

31. January 2004
