IMPORT os
MAIN
DEFINE result INTEGER
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "clearfilecache"

    MENU ""
        ON ACTION DISPLAY
            DISPLAY "clearfilecache.png" TO img
        ON ACTION smiley
            DISPLAY "smiley" TO img
        ON ACTION RED
            DISPLAY os.Path.copy("red.png","clearfilecache.png")
          # RUN "ln -fs red.png clearfilecache.png"
        ON ACTION BLUE
            DISPLAY os.Path.copy("blue.png","clearfilecache.png")
          #  RUN "ln -fs blue.png clearfilecache.png"
        ON ACTION CLEAR
            CALL ui.Interface.frontCall("standard","clearFileCache",[],result)
            DISPLAY result
        ON ACTION CLOSE
            EXIT MENU
    END MENU
END MAIN