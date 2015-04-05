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
# Purpose:      build mongo databases as part of Dockerfile
#-------------------------------------------------------------------------------------------

#
# make sure the generic profile is loaded
#
WORKDIR=/work/repos/yafra-database

# environment
DBSERVER="localhost"
YAFRAPWD="yafra"
WORKDIR=/work/repos/yafra-database
TDBDB=/work/repos/yafra-database/traveldb

# print settings
echo "create yafra database on $1"
cd $WORKDIR/
echo "creating yafra mongo database"
cd yaframongo
./generate.sh
echo "creating yapki mongo database"
cd ../yapkidb
./generate.sh
echo "done"
