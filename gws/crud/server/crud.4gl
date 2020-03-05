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

PUBLIC DEFINE userError RECORD ATTRIBUTE(WSError="User error")
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
    RETURNS tableNameListType ATTRIBUTES( WSName="data", WSMedia="application/json,application/xml")

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
    ATTRIBUTES(WSGet, WSPath="/tableName/{id}", WSThrows="400:@userError")
    RETURNS tableNameType ATTRIBUTES(WSName="rec", WSMedia="application/json,application/xml")

DEFINE d tableNameType

    SELECT * INTO d.* FROM tableName WHERE @id = id
    IF SQLCA.sqlcode == NOTFOUND THEN
        LET userError.message = SFMT("Could not find tableName with id :%1",id)
        CALL com.WebServiceEngine.SetRestError(400,userError)
    END IF
    RETURN d.*
END FUNCTION





FUNCTION len()
    ATTRIBUTES(WSGet, WSPath="/tableName/length")
    RETURNS INTEGER 

DEFINE cnt INTEGER

    SELECT COUNT(*) INTO cnt FROM tableName
    RETURN cnt
END FUNCTION



FUNCTION create(data tableNameType)
    ATTRIBUTES(WSPost, WSPath="/tableName")
    
    INSERT INTO tableName VALUES (data.*)
END FUNCTION



FUNCTION update(id INTEGER ATTRIBUTES(WSParam),
    data tableNameType )
    ATTRIBUTES(WSPut, WSPath="/tableName/{id}")
    
    UPDATE tableName
        SET str = data.str,
            dmy = data.dmy,
            num = data.num
        WHERE @id  = id
END FUNCTION



FUNCTION delete(id INTEGER ATTRIBUTES(WSParam))
    ATTRIBUTES(WSDelete, WSPath="/tableName/{id}")
    
    DELETE FROM tableName WHERE @id = id
END FUNCTION
