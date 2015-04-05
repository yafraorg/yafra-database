#!/bin/sh
#
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
#
# generate mongo database yapki
#
#

# set the db hostname
if [ -z "$1" ]; then
	DBHOST="127.0.0.1"
else
	DBHOST="$1"
fi

# 
# CREATE CORE DATABASE
#
echo "setup mongo database - add user yafraadmin and default values"
mongo $DBHOST/yapki dbe_users.js
mongo $DBHOST/yapki dbe_testdata.js
