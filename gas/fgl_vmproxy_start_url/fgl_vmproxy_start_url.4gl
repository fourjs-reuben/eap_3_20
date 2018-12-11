MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    env, value STRING
END RECORD
DEFINE ch base.Channel
DEFINE pos INTEGER
DEFINE line STRiNG
DEFINE row INTEGER

    LET ch = base.Channel.create()
    CALL ch.openPipe("env | grep 'FGL\_' | sort", "r")
    WHILE TRUE
        LET line = ch.readLine()
        IF line IS NULL THEN
            EXIT WHILE
        END IF
        LET pos = line.getIndexOf("=",1)
        IF pos = 0 THEN
            CONTINUE WHILE
        END IF
        LET arr[arr.getLength()+1].env = line.subString(1,pos-1)
        
        LET arr[arr.getLength()].value = line.suBString(pos+1, line.getLength())
        IF arr[arr.getLength()].env = "FGL_VMPROXY_START_URL" THEN
            LET row = arr.getLength()
        END IF
    END WHILE
    OPEN WINDOW w WITH FORM "fgl_vmproxy_start_url"
    DISPLAY ARRAY arr TO scr.*
        BEFORE DISPLAY
            CALL DIALOG.setCurrentRow("scr",row)
    END DISPLAY
END MAIN