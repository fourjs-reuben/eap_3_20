
IMPORT FGL rectangle
IMPORT FGL circle

TYPE Shape INTERFACE
    area () RETURNS FLOAT,
    kind () RETURNS STRING
END INTERFACE
    
FUNCTION totalArea(shapes DYNAMIC ARRAY OF Shape) RETURNS FLOAT
    DEFINE i INT
    DEFINE area FLOAT
    FOR i = 1 TO shapes.getLength()
        LET area = area + shapes[i].area()
    END FOR
    RETURN area 
END FUNCTION

FUNCTION main()
    DEFINE r1 rectangle.Rectangle
    DEFINE c1 circle.Circle
    DEFINE shapes DYNAMIC ARRAY OF Shape

    CALL r1.setDimensions(10,20)
    CALL c1.setDiameter(20)

    LET shapes[1] = r1
    LET shapes[2] = c1

    DISPLAY shapes[1].kind(), shapes[1].area()
    DISPLAY shapes[2].kind(), shapes[2].area()
    DISPLAY "Total:", totalArea(shapes)

     let r1.width = 10
     DISPLAY shapes[1].kind(), shapes[1].area()
    let r1.width = 100
     DISPLAY shapes[1].kind(), shapes[1].area()

    call foo(r1)

END function

function foo(s Shape)
    display "foo", s.area()
end function