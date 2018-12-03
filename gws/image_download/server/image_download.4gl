IMPORT os
PUBLIC TYPE listType RECORD
    files DYNAMIC ARRAY OF STRING
END RECORD


-- http://localhost:8090/ws/r/Image_Download/get?filename=ssmiley.png
FUNCTION get(
    filename STRING ATTRIBUTES("WSQuery")
    )
    ATTRIBUTES (WSGet, WSPath="/get")
    RETURNS BYTE ATTRIBUTES(WSName="img")

DEFINE b BYTE

    LOCATE b IN MEMORY
    CALL b.readFile(filename)
    RETURN b
END FUNCTION


FUNCTION list() ATTRIBUTES(WSGet, WSPath="/list")
     RETURNS listType ATTRIBUTES(WSName="list", WSMedia="application/json,application/xml")

DEFINE l listType
DEFINE dir_hdl INTEGER
DEFINE filename STRING

    CALL os.Path.dirFMask(7)
    LET dir_hdl = os.Path.dirOpen(".")
    WHILE TRUE
        LET filename = os.Path.dirNext(dir_hdl)
        IF filename IS NULL THEN
            EXIT WHILE
        END IF
        CASE os.Path.extension(filename)
            WHEN "jpg"
            WHEN "png"
            WHEN "bmp"
            WHEN "gif"
            OTHERWISE
                # not an image move on
                CONTINUE WHILE
        END CASE
        LET l.files[l.files.getLength()+1] = filename
    END WHILE

    RETURN l.*
END FUNCTION
