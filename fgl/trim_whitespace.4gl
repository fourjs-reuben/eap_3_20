MAIN
DEFINE s STRING

    LET s = "ABC\t   "
    DISPLAY s.trim().getLength()           -- Will return 4 as tab character is not trimmed
    DISPLAY s.trimWhiteSpace().getLength() -- Will return 3 as tab character is trimmed

    LET s= "line 1\nline 2\n"
    DISPLAY s.trim().getLength()           -- Will return 14 as new line character is not trimmed
    DISPLAY s.trimWhiteSpace().getLength() -- Will return 13 as new line character is trimmed
END MAIN