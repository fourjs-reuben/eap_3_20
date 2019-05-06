PUBLIC TYPE Rectangle RECORD
    height, width FLOAT
END RECORD

PUBLIC FUNCTION (r Rectangle) area () RETURNS FLOAT
    RETURN r.height * r.width
END FUNCTION

PUBLIC FUNCTION (r Rectangle) kind () RETURNS STRING
    RETURN "Rectangle"
END FUNCTION

PUBLIC FUNCTION (r Rectangle) setDimensions (w FLOAT, h FLOAT)
    LET r.width = h
    LET r.height = h
END FUNCTION