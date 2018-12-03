IMPORT com
IMPORT FGL image_download

MAIN
DEFINE result INTEGER

    CALL com.WebServiceEngine.RegisterRestService("image_download","Image_Download",NULL,NULL)
    CALL com.WebServiceEngine.Start()
    
    WHILE TRUE
        LET result = com.WebServiceEngine.ProcessServices(-1)
    END WHILE
    
END MAIN
