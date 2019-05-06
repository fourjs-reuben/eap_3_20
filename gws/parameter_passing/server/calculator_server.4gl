DEFINE Context DICTIONARY ATTRIBUTE(WSContext)OF STRING
DEFINE keys DYNAMIC ARRAY OF STRING
DEFINE i INTEGER


FUNCTION add_wsparam(
    a INTEGER ATTRIBUTES(WSParam),
    b INTEGER ATTRIBUTES(WSParam)
    )
    ATTRIBUTES (WSGet, WSPath="/Add_wsparam/{a}/{b}")
    RETURNS INTEGER 

DEFINE c INTEGER

    LET c = a + b
    RETURN c
END FUNCTION

FUNCTION add_wsquery(
    a INTEGER ATTRIBUTES(WSQuery),
    b INTEGER ATTRIBUTES(WSQuery)
    )
    ATTRIBUTES (WSGet, WSPath='/Add_wsquery')
    RETURNS INTEGER

DEFINE c INTEGER

    LET c = a + b
    RETURN c
END FUNCTION

FUNCTION add_wscookie(
    a INTEGER ATTRIBUTES(WSCookie),
    b INTEGER ATTRIBUTES(WSCookie)
    )
    ATTRIBUTES (WSGet, WSPath='/Add_wscookie')
    RETURNS INTEGER

DEFINE c INTEGER

    LET c = a + b
    RETURN c
END FUNCTION

FUNCTION add_wsheader(
    a INTEGER ATTRIBUTES(WSHeader),
    b INTEGER ATTRIBUTES(WSHeader)
    )
    ATTRIBUTES (WSGet, WSPath='/Add_wsheader')
    RETURNS INTEGER

DEFINE c INTEGER

    LET keys = Context.getKeys()
    DISPLAY "Here", keys.getLength()
    FOR i = 1 TO keys.getLength()
        DISPLAY keys[i],"=", Context[keys[i]]
    END FOR
    LET c = a + b
    RETURN c
END FUNCTION