MAIN
DEFINE rec1, rec2, rec3 RECORD
    x, y INTEGER
END RECORD

DEFINE arr1, arr2, arr3 DYNAMIC ARRAY OF RECORD
    x, y INTEGER
END RECORD

DEFINE carr1, carr2, carr3 DYNAMIC ARRAY OF RECORD
    x, y INTEGER
END RECORD


    LET rec1.x = 1
    LET rec1.y = 2
    LET rec2 = rec1
    LET rec3.* = rec1.*

    DISPLAY rec2.x
    DISPLAY rec3.x
    LET rec1.x = 2
     DISPLAY rec2.x
    DISPLAY rec3.x

    LET arr1[1].x = 1
    LET arr1[1].y = 2
    LET arr2 = arr1
    LET arr3.* = arr1.*

    DISPLAY arr2[1].x
    DISPLAY arr3[1].x
    LET arr1[1].x = 2
    DISPLAY arr2[1].x
    DISPLAY arr3[1].x

    LET carr1[1].x = 1
    LET carr1[1].y = 2
    CALL carr1.copyTo(carr2)
    CALL carr1.copyTo(carr3)

    DISPLAY carr2[1].x
    DISPLAY carr3[1].x
    LET carr1[1].x = 2
    DISPLAY carr2[1].x
    DISPLAY carr3[1].x

    INITIALIZE rec1.*, rec2.* TO NULL
    LET rec1.x = 1
    LET rec2.x = 1
    IF rec1.* = rec2.* THEN
        DISPLAY "EQUAL"
    ELSE
        DISPLAY "NOT EQUAL"
    END IF
--    IF rec1 == rec2 THEN
--        DISPLAY "EQUAL"
--    ELSE
--        DISPLAY "NOT EQUAL"
--    END IF
--
--    IF arr1 == arr2 THEN
--        DISPLAY "EQUAL"
--    END IF
--    IF arr1.* == arr2.* THEN
--        DISPLAY "EQUAL"
--    END IF
    

    
END MAIN
    