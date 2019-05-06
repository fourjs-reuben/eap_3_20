IMPORT com

PUBLIC DEFINE fatalError RECORD ATTRIBUTES(WSError="fatal error")
    message STRING
END RECORD
FUNCTION divide(
    a INTEGER ATTRIBUTES(WSParam),
    b INTEGER ATTRIBUTES(WSParam)
    )
    ATTRIBUTES (WSGet, WSThrows="412:@fatalError,406:should not happen", WSPath="/Divide/{a}/{b}")
    RETURNS INTEGER 

DEFINE c INTEGER

    IF b = 0 THEN
        LET fatalError.message = "Divide by zero"
        CALL com.WebServiceEngine.setRestError(412,fatalError)
    END IF
    IF 1==0 THEN
        CALL com.WebServiceEngine.SetRestError(406,NULL) 
    END IF
    LET c = a / b
    RETURN c
END FUNCTION