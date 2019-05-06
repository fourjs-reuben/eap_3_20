# =============================================================================
# Generated using Genero Ghost Client 2.00.04-201902071547
# =============================================================================
IMPORT FGL ggc

PRIVATE DEFINE stats ggc.Statistics

MAIN
    CALL ggc.setApplicationName("calculator")
    CALL ggc.parseOptions()
    CALL play()
    EXIT PROGRAM 0
END MAIN

FUNCTION play()
    # Select new scenario : id=0
    CALL ggc.selectScenario(0)

    # Ensure the window name is: w
    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    # Ensure the window title is: Calculator
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    # Ensure the form name is: calculator
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    # Ensure the form title is: Calculator
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    # Ensure the focused field name is: formonly.a
    CALL ggc.assert(ggc.getFocus() == "formonly.a", SFMT("Focused field name is not valid, expected: '$(fieldName)', got: '%1'", ggc.getFocus()))
    # Ensure the Edit form field formonly.a value is: 0
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    # Ensure the Edit form field formonly.b value is: 0
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    # Ensure the Edit form field formonly.c value is: 0
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    # Ensure the focused Edit field value is: 0
    CALL ggc.assertEquals(ggc.getValue(), "0", SFMT("Focused field value is not valid, expected: '0', got: '%1'", ggc.getValue())) -- INTEGER
    # Ensures the action 'add' is active
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    # Ensures the action 'close' is active
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close

    # Update form field value
    CALL ggc.wait(1682)
    CALL ggc.setValue("1")

    # Trigger key Tab
    CALL ggc.wait(0)
    CALL ggc.key("Tab")

    # Ensure the window name is: w
    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    # Ensure the window title is: Calculator
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    # Ensure the form name is: calculator
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    # Ensure the form title is: Calculator
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    # Ensure the focused field name is: formonly.b
    CALL ggc.assert(ggc.getFocus() == "formonly.b", SFMT("Focused field name is not valid, expected: '$(fieldName)', got: '%1'", ggc.getFocus()))
    # Ensure the Edit form field formonly.a value is: 1
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "1", SFMT("Field value is not valid, expected: '1', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    # Ensure the Edit form field formonly.b value is: 0
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    # Ensure the Edit form field formonly.c value is: 0
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    # Ensure the focused Edit field value is: 0
    CALL ggc.assertEquals(ggc.getValue(), "0", SFMT("Focused field value is not valid, expected: '0', got: '%1'", ggc.getValue())) -- INTEGER
    # Ensures the action 'add' is active
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    # Ensures the action 'close' is active
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close

    # Update form field value
    CALL ggc.wait(1338)
    CALL ggc.setValue("2")

    # Trigger action add
    CALL ggc.wait(0)
    CALL ggc.action("add") -- add

    # Ensure the window name is: w
    CALL ggc.assert(ggc.getWindowName() == "w", SFMT("Window name is not valid, expected: 'w', got: '%1'", getWindowName()))
    # Ensure the window title is: Calculator
    CALL ggc.assert(ggc.getWindowTitle() == "Calculator", SFMT("Window title is not valid, expected: 'Calculator', got: '%1'", getWindowTitle()))
    # Ensure the form name is: calculator
    CALL ggc.assert(ggc.getFormName() == "calculator", SFMT("Form name is not valid, expected: 'calculator', got: '%1'", getFormName()))
    # Ensure the form title is: Calculator
    CALL ggc.assert(ggc.getFormTitle() == "Calculator", SFMT("Form title is not valid, expected: 'Calculator', got: '%1'", getFormTitle()))
    # Ensure the focused field name is: formonly.b
    CALL ggc.assert(ggc.getFocus() == "formonly.b", SFMT("Focused field name is not valid, expected: '$(fieldName)', got: '%1'", ggc.getFocus()))
    # Ensure the Edit form field formonly.a value is: 1
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.a"), "1", SFMT("Field value is not valid, expected: '1', got: '%1'", ggc.getFieldValue("formonly.a"))) -- INTEGER
    # Ensure the Edit form field formonly.b value is: 2
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.b"), "2", SFMT("Field value is not valid, expected: '2', got: '%1'", ggc.getFieldValue("formonly.b"))) -- INTEGER
    # Ensure the Edit form field formonly.c value is: 3
    CALL ggc.assertEquals(ggc.getFieldValue("formonly.c"), "3", SFMT("Field value is not valid, expected: '3', got: '%1'", ggc.getFieldValue("formonly.c"))) -- INTEGER
    # Ensure the focused Edit field value is: 2
    CALL ggc.assertEquals(ggc.getValue(), "2", SFMT("Focused field value is not valid, expected: '2', got: '%1'", ggc.getValue())) -- INTEGER
    # Ensures the action 'add' is active
    CALL ggc.assert(ggc.isActionActive("add"), "The action 'add' is not active.") -- add
    # Ensures the action 'close' is active
    CALL ggc.assert(ggc.isActionActive("close"), "The action 'close' is not active.") -- Close

    # Trigger action close
    CALL ggc.wait(1324)
    CALL ggc.action("close") -- Close

    CALL ggc.end()
END FUNCTION
