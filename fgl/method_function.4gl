IMPORT util

TYPE Rectangle RECORD
    height, width FLOAT
END RECORD

TYPE Circle RECORD
    radius FLOAT
END RECORD

# Defines the area() method for type Rectangle
FUNCTION (r Rectangle) area() RETURNS FLOAT
    RETURN r.height * r.width
END FUNCTION

# Defines the circumference() method for type Rectangle
FUNCTION (r Rectangle) circumference() RETURNS FLOAT
    RETURN 2*(r.height + r.width)
END FUNCTION

# Defines the area() method for type Circle
FUNCTION (c Circle) area() RETURNS FLOAT
    RETURN c.radius * c.radius * util.Math.pi()
END FUNCTION

# Defines the diameter() method for type Circle
FUNCTION (c Circle) diameter() RETURNS FLOAT
    RETURN c.radius * 2 
END FUNCTION

# Defines the circumference() method for type Circle
FUNCTION (c Circle) circumference() RETURNS FLOAT
    RETURN c.radius * 2 * util.Math.pi()
END FUNCTION

FUNCTION main()
    DEFINE r1 Rectangle = (height:10, width:20)
    DEFINE c1 Circle = (radius:5)
    DISPLAY r1.area()  -- Calls area() for type Rectangle
    DISPLAY c1.area()  -- Calls area() for type Circle
END FUNCTION