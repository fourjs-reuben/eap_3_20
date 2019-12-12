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

# Scenario 5d8d08a8_1 id : 0
PRIVATE FUNCTION play_0()
    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    CALL ggc.assert(ggc.getFocus() == "formonly.a", SFMT("Focused field name is not valid, expected: 'formonly.a', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getValue(), "0", SFMT("Focused field value is not valid, expected: '0', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close
    CALL ggc.wait(1667)
    CALL ggc.setValue("1")

    CALL ggc.wait(0)
    CALL ggc.key("Tab")

    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    CALL ggc.assert(ggc.getFocus() == "formonly.b", SFMT("Focused field name is not valid, expected: 'formonly.b', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "1", SFMT("Field value is not valid, expected: '1', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getValue(), "0", SFMT("Focused field value is not valid, expected: '0', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close
    CALL ggc.wait(1624)
    CALL ggc.setValue("2")

    CALL ggc.wait(0)
    CALL ggc.action("add") -- add

    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    CALL ggc.assert(ggc.getFocus() == "formonly.b", SFMT("Focused field name is not valid, expected: 'formonly.b', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "1", SFMT("Field value is not valid, expected: '1', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "2", SFMT("Field value is not valid, expected: '2', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "4", SFMT("Field value is not valid, expected: '3', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getValue(), "2", SFMT("Focused field value is not valid, expected: '2', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close
    CALL ggc.wait(2693)
    CALL ggc.action("close") -- Close

END FUNCTION

