MAIN
    CLOSE WINDOW SCREEN
    CALL ui.Interface.loadStyles("home.4st")
    OPEN WINDOW w WITH FORM "home" ATTRIBUTES(STYLE="home", TEXT="Home Screen Example")
    DISPLAY "pool_doctors_taptocontinue_blue.png" TO home
    MENU ""
        ON ACTION continue
            EXIT MENU
        ON ACTION close
            EXIT MENU
        ON ACTION help ATTRIBUTES(TEXT="Help", IMAGE="question")
        ON ACTION about ATTRIBUTES(TEXT="About", IMAGE="information")
    END MENU
END MAIN