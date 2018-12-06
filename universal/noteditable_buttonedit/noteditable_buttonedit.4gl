MAIN
DEFINE rec RECORD
    field1 INTEGER,
    field2 INTEGER,
    field3 INTEGER,
    field4 INTEGER
END RECORD

    LET rec.field1 = 1
    LET rec.field2 = 2
    LET rec.field3 = 3
    LET rec.field4 = 4
    CALL ui.Interface.loadStyles("noteditable_buttonedit.4st")
    OPEN WINDOW w WITH FORM "noteditable_buttonedit" 
    
    INPUT BY NAME rec.* ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS=TRUE)
        ON ACTION drill INFIELD field1
            CALL FGL_WINMESSAGE("Info","Drilldown on Field1","info")
        ON ACTION drill INFIELD field2
            CALL FGL_WINMESSAGE("Info","Drilldown on Field2","info")
        ON ACTION drill INFIELD field3
            CALL FGL_WINMESSAGE("Info","Drilldown on Field3","info")
        ON ACTION drill INFIELD field4
            CALL FGL_WINMESSAGE("Info","Drilldown on Field4","info")
        ON ACTION close
            EXIT INPUT
    END INPUT

    
END MAIN