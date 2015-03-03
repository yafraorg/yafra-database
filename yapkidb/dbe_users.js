use yapki
db.createUser( 
 {
    user: "yafraadmin",
    pwd: "yafra",
    roles: [ { role: "userAdmin", db: "yapki" } ]   } )

#use admin
#db.createUser( 
# {
#    user: "admin",
#    pwd: "yafra",
#    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]   } )
