MAIN
DEFINE result STRING
    MENU ""
        ON ACTION list
            CALL ui.Interface.frontCall("theme","listThemes",[],result)
            DISPLAy result
        ON ACTION close
            EXIT MENU
    END MENU
END MAIN