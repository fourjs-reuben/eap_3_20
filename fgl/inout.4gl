
TYPE recType RECORD
    p1, p2 INTEGER
END RECORD

MAIN
DEFINE a recType

    LET a.p1 = 1
    LET a.p2= 2
    CALL swap(a)
    DISPLAY a.p1
END MAIN

FUNCTION swap(this recType INOUT)
DEFINE tmp INTEGER
    LET tmp = this.p1
    LET this.p1 = this.p2
    LET this.p2 = tmp
END FUNCTION