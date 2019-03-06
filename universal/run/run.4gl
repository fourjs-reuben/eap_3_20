MAIN
DEFINE depth INTEGER

    LET depth = nvl(base.Application.getArgument(1),0)
    CLOSE WINDOW SCREEN
    IF depth = 0 THEN
        OPEN WINDOW w WITH FORM "run" ATTRIBUTES(STYLE="main")
    ELSE
        OPEN WINDOW w WITH FORM "run" 
    END IF
    DISPLAY BY NAME depth
    DISPLAY CURRENT HOUR TO FRACTION TO start_time
    
    MENU ""
        ON ACTION run
            RUN SFMT("fglrun run %1", depth+1)
        ON ACTION runww
            RUN SFMT("fglrun run %1", depth+1) WITHOUT WAITING
        ON ACTION close
            EXIT MENU
        ON ACTION exit
            EXIT MENU
    END MENU
END MAIN