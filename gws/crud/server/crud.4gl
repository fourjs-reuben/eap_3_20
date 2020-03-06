IMPORT com
TYPE tableNameType RECORD
    id INTEGER,
    str STRING,
    dmy DATE,
    num INTEGER
END RECORD

TYPE tableNameListType RECORD
    rows DYNAMIC ARRAY OF tableNameType
END RECORD

PUBLIC DEFINE userError_400 RECORD ATTRIBUTE(WSError="Default User error 400")
  message STRING
END RECORD

PUBLIC DEFINE userError_404 RECORD ATTRIBUTE(WSError="Default User error 404")
  message STRING
END RECORD



-- Not exposed as a web service, called when the web service starts
FUNCTION init()
    CONNECT TO ":memory:"

    -- Create a rudimentary table
    CREATE TABLE tableName(
        id INTEGER, -- Primary Key
        str VARCHAR(255),
        dmy DATE,
        num INTEGER
        )
END FUNCTION



FUNCTION list()
    ATTRIBUTES(WSGet, WSPath="/tableName")
    RETURNS tableNameListType ATTRIBUTES( WSName="data", WSDescription="Returns all rows of a database table", WSMedia="application/json,application/xml")

DEFINE data tableNameListType
DEFINE rec tableNameType
DEFINE i INTEGER = 0

    DECLARE curs CURSOR FOR SELECT * FROM tableName
    FOREACH curs INTO rec.*
        LET i = i + 1
        LET data.rows[i].* = rec.*
    END FOREACH
    
    RETURN data.*
END FUNCTION



FUNCTION read(id  INTEGER ATTRIBUTES(WSParam))
    ATTRIBUTES(WSGet, WSPath="/tableName/{id}", WSDescription="Returns a row of a database table", WSThrows="400:@userError_400, 404:@userError_404")
    RETURNS tableNameType ATTRIBUTES(WSName="rec", WSMedia="application/json,application/xml")

DEFINE d tableNameType

    IF id IS NULL OR id < 1 THEN
        LET userError_400.message = "Bad Id, must be integer greater than 0"
        CALL com.WebServiceEngine.SetRestError(400,userError_400)
        RETURN d.*
    END IF

    SELECT * INTO d.* FROM tableName WHERE @id = id
    IF SQLCA.sqlcode == NOTFOUND THEN
        LET userError_404.message = SFMT("Could not find row in tableName with id :%1",id)
        CALL com.WebServiceEngine.SetRestError(404,userError_404)
        RETURN d.*
    END IF
    RETURN d.*
END FUNCTION





FUNCTION len()
    ATTRIBUTES(WSGet, WSPath="/tableName/length", WSDescription = "Returns number of rows in database table")
    RETURNS INTEGER 

DEFINE cnt INTEGER

    SELECT COUNT(*) INTO cnt FROM tableName
    RETURN cnt
END FUNCTION



FUNCTION create(data tableNameType)
    ATTRIBUTES(WSPost, WSPath="/tableName", WSDescription="Inserts a row into a database table")
    
    INSERT INTO tableName VALUES (data.*)
END FUNCTION



FUNCTION update(id INTEGER ATTRIBUTES(WSParam),
    data tableNameType )
    ATTRIBUTES(WSPut, WSPath="/tableName/{id}", WSDescription="Updates a row in a database table", WSThrows="400:@userError_400, 404:@userError_404")

    IF id IS NULL OR id < 1 THEN
        LET userError_400.message = "Bad Id, must be integer greater than 0"
        CALL com.WebServiceEngine.SetRestError(400,userError_400)
        RETURN 
    END IF
    
    UPDATE tableName
        SET str = data.str,
            dmy = data.dmy,
            num = data.num
        WHERE @id  = id

    IF SQLCA.sqlerrd[3] == 0 THEN
        LET userError_404.message = SFMT("Could not find row in tableName with id :%1",id)
        CALL com.WebServiceEngine.SetRestError(404,userError_404)
    END IF
END FUNCTION



FUNCTION delete(id INTEGER ATTRIBUTES(WSParam))
    ATTRIBUTES(WSDelete, WSPath="/tableName/{id}", WSDescription="Deletes a row in a database table", WSThrows="400:@userError_400, 404:@userError_404")

    IF id IS NULL OR id < 1 THEN
        LET userError_400.message = "Bad Id, must be integer greater than 0"
        CALL com.WebServiceEngine.SetRestError(400,userError_400)
        RETURN 
    END IF
    
    DELETE FROM tableName WHERE @id = id

    IF SQLCA.sqlerrd[3] == 0 THEN
        LET userError_404.message = SFMT("Could not find row in tableName with id :%1",id)
        CALL com.WebServiceEngine.SetRestError(404,userError_404)
    END IF
END FUNCTION
