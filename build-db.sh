#!/bin/sh
#-------------------------------------------------------------------------------------------
#  Copyright 2012 yafra.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#-------------------------------------------------------------------------------------------
# Author:        yafra
#
# Purpose:      build database as part of Dockerfile
# Arguments:    1: mysql/oracle/derby/mssql/mongodb
#-------------------------------------------------------------------------------------------

#
# make sure the generic profile is loaded
#
WORKDIR=/work/repos/yafra-database
if [ -z "$1" ]; then
	echo "missing arguments 1 mysql/derby/mssql/oracle/mongodb"
	exit
fi

# environment
DBSERVER="localhost"
YAFRAPWD="yafra"
WORKDIR=/work/repos/yafra-database
TDBDB=/work/repos/yafra-database/traveldb

# print settings
echo "create yafra database on $1"
cd $WORKDIR/yafradb/
if [ "$1" = "mysql" ]; then
	echo "using the mysql database"
	./generate.sh mysql
fi
if [ "$1" = "derby" ]; then
	echo "using the derby database"
	./generate.sh derby
fi
if [ "$1" = "oracle" ]; then
	echo "using the oracle database"
	./generate.sh oracle
fi
if [ "$1" = "mssql" ]; then
	echo "using the mssql database"
	./generate.sh mssql
fi

# create database TDB and YafraDB as part of setupdb command
cd $WORKDIR/traveldb
# this works fine on unix with perl
	if [ "$1" = "mysql" ]; then
		echo "installing mysql database"
		cd $TDBDB/mysql
		$TDBDB/mysql/convert.sh
		$TDBDB/mysql/generate.sh tdbadmin
	fi
	if [ "$1" = "oracle" ]; then
		echo "installing oracle database"
		cd $TDBDB/oracle
		$TDBDB/oracle/convert.sh
		$TDBDB/oracle/generate.bat tdbadmin $SAPWD
	fi
	if [ "$1" = "mssql" ]; then
		echo "installing mssql database"
		cd $TDBDB/mssql
		$TDBDB/mssql/convert.sh
		$TDBDB/mssql/generate.bat $SAPWD yafra
	fi
	if [ "$1" = "derby" ]; then
		echo "derby travel db NOT support - only yafradb example"
	fi
fi
