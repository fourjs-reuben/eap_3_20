MAIN
DEFINE result STRING

    CLOSE WINDOW SCREEN
    CALL ui.Interface.loadStyles("hbox_splitview")
  #  OPEN WINDOW w WITH FORM "hbox_splitview"
 #   OPEN WINDOW w WITH FORM "hbox_splitview_hidden"
  #  OPEN WINDOW w WITH FORM "hbox_splitview_group"
     OPEN WINDOW w WITH FORM "hbox_splitview_three"
 #   OPEN WINDOW w WITH FORM "hbox_splitview_nested"
  #  OPEN WINDOW w WITH FORM "hbox_splitview_split"
    MENU ""
        ON ACTION accept
            EXIT MENU
        ON ACTION info
            CALL ui.Interface.frontCall("standard","feInfo","windowSize",result)
            CALL FGL_WINMESSAGE("Info",result,"info")
    END MENU
END MAIN