IMPORT FGL calculator

MAIN
DEFINE a,b,c INTEGER = 0

DEFINE wsstatus INTEGER
DEFINE result INTEGER

    DEFER INTERRUPT
    DEFER QUIT

    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP
    CALL ui.Dialog.setDefaultUnbuffered(TRUE)

    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "calculator_client"
    
    INPUT BY NAME a, b,c  ATTRIBUTES(WITHOUT DEFAULTS=TRUE, ACCEPT=FALSE, CANCEL=FALSE)
        ON ACTION wsparam ATTRIBUTES(TEXT="WSParam")
            CALL calculator.add_wsparam(a,b) RETURNING wsstatus, result
            IF wsstatus==0 THEN
                LET c = result
            ELSE
                INITIALIZE c TO NULL
            END IF

        ON ACTION wsquery ATTRIBUTES(TEXT="WSQuery")
            CALL calculator.add_wsquery(a,b) RETURNING wsstatus, result
            IF wsstatus==0 THEN
                LET c = result
            ELSE
                INITIALIZE c TO NULL
            END IF

        ON ACTION wscookie ATTRIBUTES(TEXT="WSCookie")
            CALL calculator.add_wscookie(a,b) RETURNING wsstatus, result
            IF wsstatus==0 THEN
                LET c = result
            ELSE
                INITIALIZE c TO NULL
            END IF

        ON ACTION wsheader ATTRIBUTES(TEXT="WSHeader")
            CALL calculator.add_wsheader(a,b) RETURNING wsstatus, result
            IF wsstatus==0 THEN
                LET c = result
            ELSE
                INITIALIZE c TO NULL
            END IF

        ON ACTION close
            EXIT INPUT
    END INPUT
END MAIN