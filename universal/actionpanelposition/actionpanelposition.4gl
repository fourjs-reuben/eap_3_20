MAIN
DEFINE style STRING
DEFINE window_opened_flag BOOLEAN = FALSE

    CALL ui.Interface.loadStyles("actionpanelposition.4st")
    -- Menu with no window
    WHILE TRUE
        IF style IS NOT NULL THEN
            OPEN WINDOW win WITH FORM "actionpanelposition" ATTRIBUTES(STYLE=style)
            LET window_opened_flag = TRUE
        END IF
        MENU ""
            ON ACTION txt ATTRIBUTES(TEXT="Action")
                CALL do_action()
            ON ACTION img ATTRIBUTES(IMAGE="smiley", TEXT="")
                CALL do_action()
            ON ACTION both ATTRIBUTES(TEXT="Action", IMAGE="smiley")
                CALL do_action()
            ON ACTION top ATTRIBUTES(TEXT="Top")
                LET style = "top"
                EXIT MENU
            ON ACTION left ATTRIBUTES(TEXT="Left")
                LET style = "pleft"
                EXIT MENU
            ON ACTION bottom ATTRIBUTES(TEXT="Bottom")
                LET style = "bottom"
                EXIT MENU
            ON ACTION right ATTRIBUTES(TEXT="Right")
                LET style = "right"
                EXIT MENU
            ON ACTION overflow ATTRIBUTES(TEXT="Overflow")
                CALL do_overflow()
            ON ACTION closewindow ATTRIBUTES(TEXT="Close Window")
                INITIALIZE style TO NULL
                EXIT MENU
            ON ACTION close
                -- NO back as first menu
                EXIT MENU
        END MENU
        IF window_opened_flag THEN
            CLOSE WINDOW win
            LET window_opened_flag = FALSE
        END IF
    END WHILE

    
END MAIN



FUNCTION do_action()
    MENU ""
        ON ACTION txt ATTRIBUTES(TEXT="Action")
            CALL do_action()
        ON ACTION img ATTRIBUTES(IMAGE="smiley", TEXT="")
            CALL do_action()
        ON ACTION both ATTRIBUTES(TEXT="Action", IMAGE="smiley")
            CALL do_action()
        ON ACTION cancel
            EXIT MENU
    END MENU
END FUNCTION



FUNCTION do_overflow()
    MENU ""
        ON ACTION action1 EXIT MENU
        ON ACTION action2 EXIT MENU
        ON ACTION action3 EXIT MENU
        ON ACTION action4 EXIT MENU
        ON ACTION action5 EXIT MENU
        ON ACTION action6 EXIT MENU
        ON ACTION action7 EXIT MENU
        ON ACTION action8 EXIT MENU
        ON ACTION action9 EXIT MENU
        ON ACTION action10 EXIT MENU
        ON ACTION action11 EXIT MENU
        ON ACTION action12 EXIT MENU
        ON ACTION action13 EXIT MENU
        ON ACTION action14 EXIT MENU
        ON ACTION action15 EXIT MENU
        ON ACTION action16 EXIT MENU
        ON ACTION action17 EXIT MENU
        ON ACTION action18 EXIT MENU
        ON ACTION action19 EXIT MENU        
        ON ACTION action20 EXIT MENU
        ON ACTION close EXIT MENU
    END MENU
END FUNCTION


