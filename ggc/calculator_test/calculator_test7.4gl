# =============================================================================
# Generated using Genero Ghost Client 2.00.05-201904251406
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
    CALL ggc.checkWindowName("w")
    # Ensure the window title is: Calculator
    CALL ggc.checkWindowTitle("Calculator")
    # Ensure the form name is: calculator
    CALL ggc.checkFormName("calculator")
    # Ensure the form title is: Calculator
    CALL ggc.checkFormTitle("Calculator")
    # Ensure the focused field name is: formonly.a
    CALL ggc.checkFocus("formonly.a")
    # Ensure the Edit form field formonly.a value is: 0
    CALL ggc.checkFieldValue("formonly.a", "0") -- INTEGER
    # Ensure the Edit form field formonly.b value is: 0
    CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
    # Ensure the Edit form field formonly.c value is: 0
    CALL ggc.checkFieldValue("formonly.c", "0") -- INTEGER
    # Ensure the focused Edit field value is: 0
    CALL ggc.checkValue("0")
    # Ensures the action 'add' is active
    CALL ggc.checkActionActive("add") -- add
    # Ensures the action 'close' is active
    CALL ggc.checkActionActive("close") -- Close

    # Update form field value
    CALL ggc.wait(5984)
    CALL ggc.setValue("1")

    # Trigger key Tab
    CALL ggc.wait(0)
    CALL ggc.key("Tab")

    # Ensure the window name is: w
    CALL ggc.checkWindowName("w")
    # Ensure the window title is: Calculator
    CALL ggc.checkWindowTitle("Calculator")
    # Ensure the form name is: calculator
    CALL ggc.checkFormName("calculator")
    # Ensure the form title is: Calculator
    CALL ggc.checkFormTitle("Calculator")
    # Ensure the focused field name is: formonly.b
    CALL ggc.checkFocus("formonly.b")
    # Ensure the Edit form field formonly.a value is: 1
    CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
    # Ensure the Edit form field formonly.b value is: 0
    CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
    # Ensure the Edit form field formonly.c value is: 0
    CALL ggc.checkFieldValue("formonly.c", "0") -- INTEGER
    # Ensure the focused Edit field value is: 0
    CALL ggc.checkValue("0")
    # Ensures the action 'add' is active
    CALL ggc.checkActionActive("add") -- add
    # Ensures the action 'close' is active
    CALL ggc.checkActionActive("close") -- Close

    # Update form field value
    CALL ggc.wait(1238)
    CALL ggc.setValue("2")

    # Trigger action add
    CALL ggc.wait(0)
    CALL ggc.action("add") -- add

    # Ensure the window name is: w
    CALL ggc.checkWindowName("w")
    # Ensure the window title is: Calculator
    CALL ggc.checkWindowTitle("Calculator")
    # Ensure the form name is: calculator
    CALL ggc.checkFormName("calculator")
    # Ensure the form title is: Calculator
    CALL ggc.checkFormTitle("Calculator")
    # Ensure the focused field name is: formonly.b
    CALL ggc.checkFocus("formonly.b")
    # Ensure the Edit form field formonly.a value is: 1
    CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
    # Ensure the Edit form field formonly.b value is: 2
    CALL ggc.checkFieldValue("formonly.b", "2") -- INTEGER
    # Ensure the Edit form field formonly.c value is: 3
    CALL ggc.checkFieldValue("formonly.c", "3") -- INTEGER
    # Ensure the focused Edit field value is: 2
    CALL ggc.checkValue("2")
    # Ensures the action 'add' is active
    CALL ggc.checkActionActive("add") -- add
    # Ensures the action 'close' is active
    CALL ggc.checkActionActive("close") -- Close

    # Trigger action close
    CALL ggc.wait(1324)
    CALL ggc.action("close") -- Close

    CALL ggc.end()
END FUNCTION
