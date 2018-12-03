IMPORT FGL image_upload

MAIN
DEFINE wsstatus INTEGER
DEFINE filename STRING

    OPEN WINDOW w WITH FORM "image_upload_test"
    
    MENU ""
        ON ACTION choose_file
            CALL ui.Interface.frontCall("standard","openFile",["","Images","*.png","Select Image"],[filename])
            IF filename IS NOT NULL THEN
                CALL image_upload.put(filename) RETURNING wsstatus
                IF wsstatus = 0 THEN
                    DISPLAY "../server/last.png" TO img
                ELSE
                    CLEAR img
                END IF
            ELSE
                CLEAR img
            END IF
        ON ACTION close
            EXIT MENU
    END MENU
    
    DISPLAY wsstatus
END MAIN