IMPORT com
IMPORT FGL crud

MAIN
DEFINE result INTEGER

    CALL crud.init()

    CALL com.WebServiceEngine.RegisterRestService("crud","CRUD",NULL,NULL)
    CALL com.WebServiceEngine.Start()
    
    WHILE TRUE
        LET result = com.WebServiceEngine.ProcessServices(-1)
    END WHILE
    
END MAIN
