IMPORT util 
    
PUBLIC TYPE Circle RECORD
    diameter FLOAT
END RECORD
    
PUBLIC FUNCTION (c Circle) area () RETURNS FLOAT
    RETURN util.Math.pi() * (c.diameter/2) ** 2
END FUNCTION
    
PUBLIC FUNCTION (c Circle) kind () RETURNS STRING
    RETURN "Circle"
END FUNCTION
    
PUBLIC FUNCTION (c Circle) setDiameter (d FLOAT)
    LET c.diameter = d
END FUNCTION