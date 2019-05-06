IMPORT FGL calculator

MAIN
DEFINE wsstatus INTEGER, result INTEGER

    -- More formal method using status values indicated by library returned
    CALL calculator.divide(2,0) RETURNING wsstatus, result
    CASE wsstatus 
        WHEN calculator.C_SUCCESS
            DISPLAY "Result=", result
        WHEN calculator.C_FATALERROR
            DISPLAY "Error", result
            DISPLAY calculator.fatalError
        OTHERWISE
            DISPLAY "How did we get here?", result
            DISPLAY calculator.fatalError
    END CASE

    -- More informal using wsstatus =0 
    CALL calculator.divide(2,0) RETURNING wsstatus, result
    IF wsstatus = 0 THEN
        DISPLAY "Result=", result
    ELSE
        DISPLAY "Error", result
        DISPLAY calculator.fatalError
    END IF

     -- More formal method using status values indicated by library returned
    CALL calculator.divide(2,1) RETURNING wsstatus, result
    CASE wsstatus 
        WHEN calculator.C_SUCCESS
            DISPLAY "Result=", result
        WHEN calculator.C_FATALERROR
            DISPLAY "Error", result
            DISPLAY calculator.fatalError
        OTHERWISE
            DISPLAY "How did we get here?", result
            DISPLAY calculator.fatalError
    END CASE

    -- More informal using wsstatus =0 
    CALL calculator.divide(2,1) RETURNING wsstatus, result
    IF wsstatus = 0 THEN
        DISPLAY "Result=", result
    ELSE
        DISPLAY "Error", result
        DISPLAY calculator.fatalError
    END IF
END MAIN
    
    