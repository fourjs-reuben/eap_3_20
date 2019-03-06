MAIN
    CLOSE WINDOW SCREEN

    CALL ui.Interface.setText("ui.Interface.setText")
    CALL ui.Interface.setName("ui.Interface.setName")
    OPEN WINDOW window_main_reference WITH FORM "application_window_title_main" ATTRIBUTES(TEXT="Main Window Text Attribute")

    #CALL ui.Window.getCurrent().getForm().getNode().setAttribute("text", "ui.Form.setAttribute('text',value)")
    CALL ui.Window.getCurrent().setText("ui.Window.setText()")
    
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
        ON ACTION form
            OPEN FORM f1 FROM "application_window_title_form1"
            OPEN FORM f2 FROM "application_window_title_form2"
            OPEN WINDOW window_form_host AT 1,1 WITH 25 ROWS, 80 COLUMNS 
            DISPLAY FORM f1
            MENU ""
                ON ACTION form1
                    DISPLAY FORM f1
                ON ACTION form2
                    DISPLAY FORM f2
                ON ACTION ui_window_set_text
                    CALL ui.Window.getCurrent().setText("ui.Window.setText()")
                ON ACTION ui_window_set_form
                    CALL ui.Window.getCurrent().getForm().getNode().setAttribute("text", "ui.Form.setAttribute('text',value)")
                ON ACTION close
                    EXIT MENU
            END MENU
            CLOSE FORM f1
            CLOSE FORM f2
            CLOSE WINDOW window_form_host
            
    END MENU
END MAIN