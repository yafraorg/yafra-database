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
var testPersons =
    [
        {
            "_id": 1,
            name: "Test1",
            firstname: "Dario",
            type: "Private",
            googleid: "UID001",
            address: {
                street: "Main Street 1",
                country: "CH",
                location: "Genf",
                zip: "2000"
            }
        },
        {
            "_id": 2,
            name: "Test2",
            firstname: "Dario",
            type: "Private",
            googleid: "UID002",
            address: {
                street: "Main Street 2",
                country: "CH",
                location: "Genf",
                zip: "2000"
            }
        },
        {
            "_id": 3,
            name: "Test3",
            firstname: "Dario",
            type: "Private",
            googleid: "UID003",
            address: {
                street: "Main Street 3",
                country: "CH",
                location: "Genf",
                zip: "2000"
            }
        },
        {
            "_id": 4,
            name: "Test4",
            firstname: "Dario",
            type: "Private",
            googleid: "UID004",
            address: {
                street: "Main Street 4",
                country: "CH",
                location: "Genf",
                zip: "2000"
            }
        }
    ];

db.person.insert( testPersons );

var testPersonLogs =
    [
        {
            eventAudit: "Creation",
            eventAuditReviewer: "Admin",
            eventCreator: "Admin",
            eventDate: ISODate("2028-02-10T10:50:10Z"),
            eventDescription: "Creation of entry",
            person_id: 1
        },
        {
            eventAudit: "Creation",
            eventAuditReviewer: "Admin",
            eventCreator: "Admin",
            eventDate: ISODate("2028-02-10T10:50:10Z"),
            eventDescription: "Creation of entry",
            person_id: 2
        }
    ];

db.personlog.insert( testPersonLogs );
