# =============================================================================
# Generated using Genero Ghost Client 2.00.06-201905231412
# =============================================================================
IMPORT FGL ggc

MAIN
    CALL ggc.setApplicationName("calculator")
    CALL ggc.parseOptions()

    # Register scenario functions
    CALL ggc.registerScenario(FUNCTION play_0)

    # Start execution
    CALL ggc.play()

    EXIT PROGRAM 0
END MAIN

# Scenario 5d92e1c0_1 id : 0
PRIVATE FUNCTION play_0()
    CALL ggc.checkWindowName("w")
    CALL ggc.checkWindowTitle("Calculator")
    CALL ggc.checkFormName("calculator")
    CALL ggc.checkFormTitle("Calculator")
    CALL ggc.checkFocus("formonly.a")
    CALL ggc.checkFieldValue("formonly.a", "0") -- INTEGER
    CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
    CALL ggc.checkFieldValue("formonly.c", "0") -- INTEGER
    CALL ggc.checkValue("0")
    CALL ggc.checkActionActive("add") -- add
    CALL ggc.checkActionActive("close") -- Close
    CALL ggc.wait(2238)
    CALL ggc.setValue("1")

    CALL ggc.wait(0)
    CALL ggc.key("Tab")

    CALL ggc.checkWindowName("w")
    CALL ggc.checkWindowTitle("Calculator")
    CALL ggc.checkFormName("calculator")
    CALL ggc.checkFormTitle("Calculator")
    CALL ggc.checkFocus("formonly.b")
    CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
    CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
    CALL ggc.checkFieldValue("formonly.c", "0") -- INTEGER
    CALL ggc.checkValue("0")
    CALL ggc.checkActionActive("add") -- add
    CALL ggc.checkActionActive("close") -- Close
    CALL ggc.wait(1232)
    CALL ggc.setValue("2")

    CALL ggc.wait(0)
    CALL ggc.action("add") -- add

    CALL ggc.checkWindowName("w")
    CALL ggc.checkWindowTitle("Calculator")
    CALL ggc.checkFormName("calculator")
    CALL ggc.checkFormTitle("Calculator")
    CALL ggc.checkFocus("formonly.b")
    CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
    CALL ggc.checkFieldValue("formonly.b", "2") -- INTEGER
    CALL ggc.checkFieldValue("formonly.c", "3") -- INTEGER
    CALL ggc.checkValue("2")
    CALL ggc.checkActionActive("add") -- add
    CALL ggc.checkActionActive("close") -- Close
    CALL ggc.wait(2023)
    CALL ggc.action("close") -- Close

END FUNCTION

