IMPORT FGL ggc

PRIVATE DEFINE currentWindowName STRING
PRIVATE DEFINE currentWindowTitle STRING
PRIVATE DEFINE currentFormName STRING
PRIVATE DEFINE currentFormTitle STRING
PRIVATE DEFINE currentFieldName STRING
PRIVATE DEFINE currentValue STRING
PRIVATE DEFINE stats ggc.Statistics

MAIN
    CALL ggc.parseOptions()
    CALL play()
    EXIT PROGRAM 0
END MAIN

FUNCTION play()
    # Select new scenario : id=0
    CALL ggc.selectScenario(0)

    # Set table size
    CALL ggc.wait(100)
    CALL ggc.setTableSize("scr", 5)

    # Update table row
    CALL ggc.wait(100)
    CALL ggc.setRowFocus("scr", 4)

    CALL ggc.assertTrue(ggc.getTableSize("scr") == 10,"Table is expected to be size 10" )

    

    # Trigger action accept
    CALL ggc.wait(100)
    CALL ggc.action("accept") -- OK

    CALL ggc.stop()

    CALL getStatistics() RETURNING stats.*
    CALL ggc.showStatistics(stats.*)
    IF stats.checkFailures.getLength() > 0 THEN
        DISPLAY "Failed"
        EXIT PROGRAM 1
    END IF
    DISPLAY "Success"
END FUNCTION
