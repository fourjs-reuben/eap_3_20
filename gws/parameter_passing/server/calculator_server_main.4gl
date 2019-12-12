IMPORT com
IMPORT FGL calculator_server

MAIN
DEFINE result INTEGER

    CALL com.WebServiceEngine.RegisterRestService("calculator_server","Calculator")
    CALL com.WebServiceEngine.Start()
    WHILE TRUE
        LET result = com.WebServiceEngine.ProcessServices(-1)
    END WHILE
END MAIN