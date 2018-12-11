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
  # Ensure the form field formonly.a value is: 0
  CALL ggc.checkFieldValue("formonly.a", "0") -- INTEGER
  # Ensure the form field formonly.b value is: 0
  CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
  # Ensure the focused field value is: 0
  CALL ggc.checkValue("0")
  # Ensures the action 'add' is active
  CALL ggc.checkActionActive("add") -- add
  # Ensures the action 'close' is active
  CALL ggc.checkActionActive("close") -- Close
  # Update form field value
  CALL ggc.wait(3821)
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
  # Ensure the form field formonly.a value is: 1
  CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
  # Ensure the form field formonly.b value is: 0
  CALL ggc.checkFieldValue("formonly.b", "0") -- INTEGER
  # Ensure the focused field value is: 0
  CALL ggc.checkValue("0")
  # Ensures the action 'add' is active
  CALL ggc.checkActionActive("add") -- add
  # Ensures the action 'close' is active
  CALL ggc.checkActionActive("close") -- Close
  # Update form field value
  CALL ggc.wait(1353)
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
  # Ensure the form field formonly.a value is: 1
  CALL ggc.checkFieldValue("formonly.a", "1") -- INTEGER
  # Ensure the form field formonly.b value is: 2
  CALL ggc.checkFieldValue("formonly.b", "2") -- INTEGER
  # Ensure the focused field value is: 2
  CALL ggc.checkValue("2")
  # Ensures the action 'add' is active
  CALL ggc.checkActionActive("add") -- add
  # Ensures the action 'close' is active
  CALL ggc.checkActionActive("close") -- Close

  # add tests
  CALL ggc.checkFieldValue("formonly.c", 3) -- INTEGER


  
  # Trigger action close
  CALL ggc.wait(2094)
  CALL ggc.action("close") -- Close

  CALL ggc.stop()

  CALL getStatistics() RETURNING stats.*
  CALL ggc.showStatistics(stats.*)
  IF stats.checkFailures.getLength() > 0 THEN
    DISPLAY "Failed"
    EXIT PROGRAM 1
  END IF
  DISPLAY "Success"
END FUNCTION
