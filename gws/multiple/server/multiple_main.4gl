IMPORT com

IMPORT FGL table1
IMPORT FGL table2



MAIN
DEFINE result INTEGER

    CALL com.WebServiceEngine.RegisterRestService("table1","T1")
    CALL com.WebServiceEngine.RegisterRestService("table2","T2")
    CALL com.WebServiceEngine.Start()
    
    WHILE TRUE
        LET result = com.WebServiceEngine.ProcessServices(-1)
    END WHILE
    
END MAIN