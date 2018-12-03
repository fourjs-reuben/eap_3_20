Investigating use of RESTful Web Services to manage a resource

The operation (WSGet/WSPost/WSPut/WSDelete) and the structure/path of the URL is
able to map to the appropriate 4gl function.

list  - WSGet - http://<ip-address>/<port>/ws/r/CRUD/tableName - return all rows of data
read - WSGet - http://<ip-address>/<port>/ws/r/CRUD/tableName/{id} - return a single row of data
len - WSGet - http://<ip-address>/<port>/ws/r/CRUD/tableName/length - return number of rows of date

create - WSPost - http://<ip-address>/<port>/ws/r/CRUD/tableName - create a new row of data
update - WSPut - http://<ip-address>/<port>/ws/r/CRUD/tableName/{id} - update a row of data
delete - WSDelete - http://<ip-address>/<port>/ws/r/CRUD/tableName/{id} - delete a row of data

The test server program (server/crud.4gl) uses an inmemory database.  The first 
thing server program does when it starts is connect to memory (SQLite) and 
creates a database table (the init() function).  The other functions are all
exposed as the Web Service functions to populate and read from this database
table.

When running the client program, it is very rudimentary.  List will list all 
rows, and create will insert a row, so normal first two steps are create, list,
and then whatever


