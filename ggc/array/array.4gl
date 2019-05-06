IMPORT util
MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    field1 INTEGER,
    field2 INTEGER
END RECORD
DEFINE i INTEGER

    CALL util.Math.srand()
    FOR i = 1 TO 100
        LET arr[i].field1 = i
        LET arr[i].field2 = util.Math.rand(100)+1
    END FOR
    OPEN WINDOW w WITH FORM "array"
    DISPLAY ARRAY arr TO scr.*
END MAIN

    