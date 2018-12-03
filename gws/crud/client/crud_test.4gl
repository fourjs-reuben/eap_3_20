IMPORT FGL crud
IMPORT util

MAIN
DEFINE counter INTEGER = 0
DEFINE wsstatus INTEGER
DEFINE i INTEGER

DEFINE len INTEGER
DEFINE idx INTEGER

DEFINE rec  RECORD ATTRIBUTE(XMLName = 'element') 
                    id INTEGER ATTRIBUTE(XMLName = 'id'),
                    str STRING ATTRIBUTE(XMLName = 'str'),
                    dmy DATE ATTRIBUTE(XMLName = 'dmy'),
                    num INTEGER ATTRIBUTE(XMLName = 'num')
END RECORD

DEFINE list RECORD ATTRIBUTE(XMLName = 'data')
        rows
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            RECORD ATTRIBUTE(XMLName = 'element')
            id INTEGER ATTRIBUTE(XMLName = 'id'),
            str STRING ATTRIBUTE(XMLName = 'str'),
            dmy DATE ATTRIBUTE(XMLName = 'dmy'),
            num INTEGER ATTRIBUTE(XMLName = 'num')
        END RECORD
    END RECORD

    MENU ""
        ON ACTION create
            LET counter = counter + 1
            LET rec.id = counter
            LET rec.str = "Foo"
            LET rec.dmy = TODAY
            LET rec.num = util.math.rand(100)+1
            CALL crud.create(rec.*) RETURNING wsstatus
            DISPLAy wsstatus

        ON ACTION get
            PROMPT "Enter index" FOR idx
            CALL crud.read(idx) RETURNING wsstatus, rec.*
            DISPLAY wsstatus
            DISPLAY rec.*

        ON ACTION list
            CALL crud.list() RETURNING wsstatus, list.*
            DISPLAY wsstatus
            FOR i = 1 TO list.rows.getLength()
                DISPLAY list.rows[i].*
            END FOR

        ON ACTION length
            CALL crud.len() RETURNING wsstatus, len
            DISPLAY len

        ON ACTION update
            PROMPT "Enter index" FOR idx
            
            CALL crud.read(idx) RETURNING wsstatus, rec.*
            PROMPT "Enter string" FOR rec.str

            CALL crud.update(idx, rec.*) RETURNING wsstatus
            DISPLAY wsstatus

        ON ACTION delete
            PROMPT "Enter index" FOR idx
            CALL crud.delete(idx) RETURNING wsstatus
            DISPLAY wsstatus
            
        ON ACTION close
            EXIT MENU
    END MENU
END MAIN