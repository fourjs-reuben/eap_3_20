MAIN
    CALL test()
END MAIN

FUNCTION returns0() RETURNS ()
    RETURN 
    # RETURN TRUE   # should error
END FUNCTION

FUNCTION returns() 
    RETURN 
    RETURN TRUE   # both allowed
END FUNCTION

FUNCTION returns1() RETURNS (STRING)
DEFINE s STRING
    LET s= "foo"
    # RETURN # should error
    RETURN s
END FUNCTION

FUNCTION returns2(t BOOLEAN) RETURNS (BOOLEAN, STRING)
DEFINE ok BOOLEAN
DEFINE error_text STRING

    IF t THEN
        #OK
    ELSE
        RETURN FALSE, "Error text"
    END IF

    RETURN TRUE, ""
END FUNCTION

FUNCTION test()
DEFINE ok BOOLEAN
DEFINE error_text STRING
    CALL returns0()
    DISPLAY returns1()
    CALL returns2(TRUE) RETURNING ok, error_text
    DISPLAY ok, error_text
    CALL returns2(FALSE) RETURNING ok, error_text
    DISPLAY ok, error_text

END FUNCTION
