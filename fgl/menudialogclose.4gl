MAIN
    ---- Without window
    --MENU "Title" ATTRIBUTES(STYLE="dialog", IMAGE="smiley", COMMENT="Comment")
    --    ON ACTION CLOSE
    --        EXIT MENU
    --END MENU

    -- With Window
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "menudialogclose" ATTRIBUTES(STYLE="dialog")
    DISPLAY "smiley" TO img
    MENU "" 
        ON ACTION CLOSE
            EXIT MENU
    END MENU
    CLOSE WINDOW w
END MAIN
    