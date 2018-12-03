

TYPE addType RECORD
    a,b,c INTEGER
END RECORD

FUNCTION add_simple(
    a INTEGER ATTRIBUTES(WSQuery),
    b INTEGER ATTRIBUTES(WSQuery)
    )
    ATTRIBUTES (WSGet, WSPath="/Add/simple")
    RETURNS INTEGER 

DEFINE c INTEGER 

    LET c = a+b
    RETURN c
END FUNCTION



-- Control the response via accept header
-- curl --header 'Accept: application/json' http://localhost:8090/Calculator/Add?a=b&b=2
-- Can't use query parameter e.g. ?format=json, ?format=xml https://swagger.io/docs/specification/describing-parameters/
FUNCTION add(
    a INTEGER ATTRIBUTES(WSQuery),
    b INTEGER ATTRIBUTES(WSQuery)
    )
    ATTRIBUTES (WSGet, WSPath="/Add")
    RETURNS addType ATTRIBUTES(WSName="add", WSMedia="application/json,application/xml")

DEFINE add addType 

    LET add.a = a
    LET add.b = b
    LET add.c = add_simple(add.a, add.b)
    RETURN add.*
END FUNCTION


-- XML Only response
FUNCTION add_xml(
    a INTEGER ATTRIBUTES(WSQuery),
    b INTEGER ATTRIBUTES(WSQuery)
    )
    ATTRIBUTES (WSGet, WSPath="/Add/xml")
    RETURNS addType ATTRIBUTES(WSName="add", WSMedia="application/xml")

DEFINE add addType 

    LET add.a = a
    LET add.b = b
    LET add.c = add_simple(add.a, add.b)
    RETURN add.*
END FUNCTION



-- JSON Only response
FUNCTION add_json(
    a INTEGER ATTRIBUTES(WSQuery),
    b INTEGER ATTRIBUTES(WSQuery)
    )
    ATTRIBUTES (WSGet, WSPath="/Add/json")
    RETURNS addType ATTRIBUTES(WSName="add", WSMedia="application/json")

DEFINE add addType 

    LET add.a = a
    LET add.b = b
    LET add.c = add_simple(add.a, add.b)
    RETURN add.*
END FUNCTION