MAIN
#TODO nothing
#BUG nothing
    MENU ""
        ON ACTION fename
            MESSAGE ui.Interface.getFrontEndName()
        ON ACTION feversion
            MESSAGE ui.Interface.getFrontEndVersion()
        ON ACTION uiname
            MESSAGE ui.Interface.getUniversalClientName()
        ON ACTION uiversion
            MESSAGE ui.Interface.getUniversalClientVersion()
        ON ACTION CLOSE
            EXIT MENU
    END MENU
END MAIN