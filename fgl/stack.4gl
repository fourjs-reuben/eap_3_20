MAIN
DEFINE rec RECORD
    ed STRING,
    be STRING,
    de DATE,
    cb CHAR(1),
    co CHAR(1)
END RECORD

    CALL ui.Interface.loadStyles("stack.4st")
    OPTIONS INPUT WRAP

    LET rec.ed = "Foo"
    LET rec.be= "Foo"
    LET rec.de = TODAY
    LET rec.cb= "Y"
    LET rec.co = "Y"

    OPEN WINDOW w WITH FORM "stack"
    INPUT BY NAME rec.* ATTRIBUTES(WITHOUT DEFAULTS=TRUE)
END MAIN