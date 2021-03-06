/*
 *  Copyright 2012 yafra.org
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 * generate some test data for monogo yafra db
 *
 */
var testCerts =
    [
        {
            "_id": 1,
            name: "Test1",
            email: "Test1@test.te",
            certid: "121212",
            type: "Private",
        },
        {
            "_id": 2,
            name: "Test2",
            email: "Test2@test.te",
            certid: "121212",
            type: "WebServer",
        },
        {
            "_id": 3,
            name: "Test3",
            email: "Test3@test.te",
            certid: "121212",
            type: "SSH",
        },
        {
            "_id": 4,
            name: "Test4",
            email: "Test4@test.te",
            certid: "121212",
            type: "VPN",
        }
    ];

db.certs.insert( testCerts );

