MAIN
    CLOSE WINDOW SCREEN

    CALL ui.Interface.setText("ui.Interface.setText")
    CALL ui.Interface.setName("ui.Interface.setName")
    OPEN WINDOW window_main_reference WITH FORM "application_window_title_main" ATTRIBUTES(TEXT="Main Window Text Attribute")
    MENU "Menu name"
        ON ACTION close
            EXIT MENU
        ON ACTION modal
            OPEN WINDOW window_modal_reference WITH FORM "application_window_title_modal" ATTRIBUTES(TEXT="Modal Window Text Attribute", STYLE="dialog")
            MENU ""
                ON ACTION accept
                    EXIT MENU
            END MENU
            CLOSE WINDOW window_modal_reference
    END MENU
END MAIN