IMPORT os
IMPORT FGL image_download
PUBLIC TYPE listType RECORD
    files DYNAMIC ARRAY OF STRING
END RECORD


MAIN

DEFINE arr DYNAMIC ARRAY OF RECORD
    img, filename STRING
END RECORD

DEFINE response RECORD ATTRIBUTE(XMLName = 'list')
        files
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            STRING ATTRIBUTE(XMLName = 'element')
    END RECORD
DEFINE wsstatus INTEGER
DEFINE i INTEGER
DEFINE img BYTE
DEFINE tmp_file STRING

    LOCATE img IN MEMORY
    OPEN WINDOW w WITH FORM "image_download_test"

    DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED, ACCEPT=FALSE, CANCEL=FALSE)
        ON ACTION clear
            RUN "rm *.jpg *.png *.gif *.bmp"
            CALL arr.clear()

        ON ACTION load
            CALL image_download.list() RETURNING wsstatus, response.*
            IF wsstatus == 0 THEN
                CALL arr.clear()
                FOR i = 1 TO response.files.getLength()
                    LET arr[i].filename = response.files[i]
                END FOR
            END IF

        ON ACTION get
            FOR i = 1 TO arr.getLength()
                CALL image_download.get(arr[i].filename) RETURNING wsstatus, tmp_file
                DISPLAY wsstatus, tmp_file
                IF wsstatus == 0 THEN
                    IF os.Path.copy(tmp_file, arr[i].filename) THEN
                        LET arr[i].img = arr[i].filename
                        DISPLAY os.Path.delete(tmp_file)
                    ELSE    
                        DISPLAY "error", tmp_file, arr[i].filename
                    END IF
                END IF
            END FOR

        ON ACTION close
            EXIT DISPLAY
    END DISPLAY
END MAIN