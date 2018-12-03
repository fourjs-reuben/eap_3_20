IMPORT com
IMPORT FGL image_upload

MAIN
DEFINE result INTEGER

    CALL com.WebServiceEngine.RegisterRestService("image_upload","Image_Upload")
    CALL com.WebServiceEngine.Start()
    
    WHILE TRUE
        LET result = com.WebServiceEngine.ProcessServices(-1)
    END WHILE
    
END MAIN