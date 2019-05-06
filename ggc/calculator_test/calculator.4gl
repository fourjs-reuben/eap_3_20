MAIN
DEFINE a,b,c INTEGER 

    LET a = 0
    LET b = 0
    LET c = 0
    DEFER INTERRUPT
    DEFER QUIT

    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP
    CALL ui.Dialog.setDefaultUnbuffered(TRUE)

    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "calculator"
    
    INPUT BY NAME a, b,c  ATTRIBUTES(WITHOUT DEFAULTS=TRUE, ACCEPT=FALSE, CANCEL=FALSE)
        ON ACTION add
            LET c = a + b
        ON ACTION close
            EXIT INPUT
    END INPUT
END MAIN