MAIN
DEFINE style STRING = "default"

    CLOSE WINDOW SCREEN
    CALL ui.Interface.loadStyles("error_message.4st")
    WHILE style != "exit"
        OPEN WINDOW w WITH FORM "error_message" ATTRIBUTES(STYLE=style)
        MENU ""
            ON ACTION error ATTRIBUTES(TEXT="Error")
                ERROR SFMT("Error at %1", CURRENT HOUR TO FRACTION(1))
            ON ACTION error_red ATTRIBUTES(TEXT="Error (RED)")
                ERROR SFMT("Error at %1", CURRENT HOUR TO FRACTION(1)) ATTRIBUTES(STYLE="red")
            ON ACTION modal_error ATTRIBUTES(TEXT="Modal Error")
                ERROR SFMT("An error has occured at %1, select value from modal window", CURRENT HOUR TO FRACTION(1))
                CALL ui.Interface.refresh() -- Force error to dispay in parent window
                OPEN WINDOW w2 WITH FORM "error_message_modal" ATTRIBUTES(STYLE="dialog")
                MENU ""
                    ON ACTION accept
                        EXIT MENU
                    ON ACTION error ATTRIBUTES(TEXT="Error")
                        ERROR SFMT("Error inside modal window at %1", CURRENT HOUR TO FRACTION(1))
                END MENU
                CLOSE WINDOW w2
                
            ON ACTION message ATTRIBUTES (TEXT="Message")
                MESSAGE SFMT("Message at %1", CURRENT HOUR TO FRACTION(1))
            ON ACTION fglwinmessage_info ATTRIBUTES(TEXT="FGL_WINMESSAGE (Info)")
                CALL FGL_WINMESSAGE("Info",SFMT("FGLWINMESSAGE at %1", CURRENT HOUR TO FRACTION(1)),"info")
            ON ACTION fglwinmessage_question ATTRIBUTES(TEXT="FGL_WINMESSAGE (Question)")
                CALL FGL_WINMESSAGE("Question",SFMT("FGLWINMESSAGE at %1", CURRENT HOUR TO FRACTION(1)),"question")
            ON ACTION fglwinmessage_warning ATTRIBUTES(TEXT="FGL_WINMESSAGE (Warning)")
                CALL FGL_WINMESSAGE("Warning",SFMT("FGLWINMESSAGE at %1", CURRENT HOUR TO FRACTION(1)),"exclamation")
            ON ACTION fglwinmessage_error ATTRIBUTES(TEXT="FGL_WINMESSAGE (Error)")
                CALL FGL_WINMESSAGE("Error",SFMT("FGLWINMESSAGE at %1", CURRENT HOUR TO FRACTION(1)),"stop")
            ON ACTION popup ATTRIBUTES(TEXT="Popup")
                LET style = "popup"
                EXIT MENU
            ON ACTION statustip ATTRIBUTES(TEXT="StatusTip")
                LET style = "statustip"
                EXIT MENU
            ON ACTION lines3 ATTRIBUTES(TEXT="Lines 3")
                LET style = "lines3"
                EXIT MENU
            ON ACTION default ATTRIBUTES(TEXT="Default")
                LET style = "default"
                EXIT MENU
            ON ACTION close
                LET style = "exit"
                EXIT MENU
        END MENU
        CLOSE WINDOW w
    END WHILE
END MAIN
