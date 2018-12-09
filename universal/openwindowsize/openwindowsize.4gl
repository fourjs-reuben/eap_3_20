MAIN
DEFINE frm STRING

    MENU "" ATTRIBUTES(STYLE="dialog", COMMENT="Select Form Size")
        ON ACTION frm8025 ATTRIBUTES(TEXT="80x25")
            LET frm = "openwindow8025"
            EXIT MENU
        ON ACTION frm13240 ATTRIBUTES(TEXT="132x40")
            LET frm = "openwindow13240"
            EXIT MENU
        ON ACTION frm3010 ATTRIBUTES(TEXT="30x10")
            LET frm = "openwindow3010"
            EXIT MENU
        ON ACTION frm3010min8025 ATTRIBUTES(TEXT="30x10min80x25")
            LET frm = "openwindow3010min8025"
            EXIT MENU
    END MENU
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM frm
    
    MENU ""
        ON ACTION accept
            EXIT MENU
    END MENU
    CLOSE WINDOW w
    
    
END MAIN